extends Node2D

const COLLISION_MASK_CARD = 1
const COLLISION_MASK_CARD_SLOT = 2
const DEFAULT_CARD_SPEED = 0.1
const DEFAULT_CARD_SCALE = 0.6
const CARD_BIGGER_SCALE = 0.65
const CARD_SMALLER_SCALE = .5

var player_hand_ref
var screen_size;
var card_being_dragged;
var is_hovering_on_card;
var played_guardian_card_this_turn = false;
var selected_guardian


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(clamp(mouse_pos.x,0,screen_size.x), clamp(mouse_pos.y,0,screen_size.y))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	player_hand_ref = $"../PlayerHand"
	$"../InputManager".connect("left_mouse_button_released", on_left_click_released)

func connect_card_signals(card):
	card.connect("hovered", on_hovered_over_card)
	card.connect("hovered_off", on_hovered_off_card)

func on_hovered_over_card(card):
	$"../info/Label".text = card.card_description
	$"../info/Label2".text = card.card_name + "\nType: " + card.card_type + "\n"
	if card.card_slot_card_in:
		return
	if !is_hovering_on_card:
		is_hovering_on_card = true
		highlight_card(card, true);

func on_hovered_off_card(card):
	if !card.defeated:
		if !card.card_slot_card_in && !card_being_dragged:
			highlight_card(card,false)
			var new_card_hovered = raycast()
			if new_card_hovered:
				$"../info/Label".text = new_card_hovered.card_description
				$"../info/Label2".text = new_card_hovered.card_name + "\nType: " + new_card_hovered.card_type + "\n"
				highlight_card(new_card_hovered, true)
			else:
				$"../info/Label".text = ""
				$"../info/Label2".text = ""
				is_hovering_on_card = false
func card_clicked(card):
	if card.card_slot_card_in:
		#card on battlefield
		if $"../BattleManager".is_opponent_turn == false:
			if $"../BattleManager".player_is_attacking == false:
				if card not in $"../BattleManager".player_cards_that_attacked_this_turn:
					if $"../BattleManager".opponent_cards_on_battlefield.size() == 0:
						$"../BattleManager".direct_attack(card,"Player")
						return
					else:
						select_card_for_battle(card)
	else:
		start_drag(card)
func select_card_for_battle(card):
	if card.card_type == "Guardian":
		return  # Skip if it's a guardian card
	if selected_guardian:
		if selected_guardian == card:
			card.position.y += 20
			selected_guardian = null
		else:
			selected_guardian.position.y += 20 #note check
			selected_guardian = card 
			card.position.y -= 20
	else:
		selected_guardian = card
		card.position.y -= 20
	
func highlight_card(card, hovered):
	if card.card_slot_card_in:
		return
	if hovered:
		card.scale = Vector2(CARD_BIGGER_SCALE, CARD_BIGGER_SCALE)
		card.z_index = 2
	else:
		card.scale = Vector2(DEFAULT_CARD_SCALE, DEFAULT_CARD_SCALE)
		card.z_index = 1


func start_drag(card):
	card_being_dragged = card
	card.scale = Vector2(DEFAULT_CARD_SCALE, DEFAULT_CARD_SCALE)
	card.z_index = 100
func finish_drag():
	if not card_being_dragged:
		return
	is_hovering_on_card = false
	card_being_dragged.scale = Vector2(DEFAULT_CARD_SCALE, DEFAULT_CARD_SCALE)
	#card_being_dragged.z_index = 1
	var card_slot_found = raycast_slot();
	if card_slot_found and not card_slot_found.card_in_slot:
		if card_being_dragged.card_type == card_slot_found.card_slot_type:
			if !played_guardian_card_this_turn:
				#card scalling down
				played_guardian_card_this_turn = true
				card_being_dragged.scale = Vector2(CARD_SMALLER_SCALE, CARD_SMALLER_SCALE);
				#he does this to fix drag over issues but it used to break it vvv I changed
				card_being_dragged.z_index = 2;
				is_hovering_on_card = false
				card_being_dragged.card_slot_card_in = card_slot_found
				player_hand_ref.remove_card(card_being_dragged)
				#card dragged into empty slot
				card_being_dragged.position = card_slot_found.position
				card_slot_found.card_in_slot = true
				card_slot_found.get_node("Area2D/CollisionShape2D").disabled = true
				$"../BattleManager".player_cards_on_battlefield.append(card_being_dragged)
				if card_being_dragged.ability_script and card_being_dragged.ability_script.has_method("trigger_ability"):
					card_being_dragged.ability_script.trigger_ability($"../BattleManager", "player")
					print("Card Manager", $"../BattleManager".player_health)
					$"../PlayerHealth".text = str($"../BattleManager".player_health)
					$"../OpponentHealth".text = str($"../BattleManager".opponent_health)
					if $"../BattleManager".opponent_health <= 0 :
						print("I am death, destroyer of worlds")
						await $"../BattleManager".wait(0.5)
						global.final_turn_count = $"../BattleManager".turn_count
						get_tree().change_scene_to_file("res://Win Screen/win_scene.tscn")
						return
			#Check if player health is 0
					if $"../BattleManager".player_health <= 0:
						await $"../BattleManager".wait(0.5)
						get_tree().change_scene_to_file("res://Lose Screen/lose_scene.tscn");
						return
						await $"../BattleManager".wait(.5)
					else:
						pass
				if card_being_dragged.ability_script and card_being_dragged.ability_script.has_method("reset_ability"):
					card_being_dragged.ability_script.reset_ability($"../Card Manager", "player")
				card_being_dragged = null;
				return
	player_hand_ref.add_card_to_hand(card_being_dragged, DEFAULT_CARD_SPEED)
	card_being_dragged.z_index = 3
	card_being_dragged = null;

func unselect_selected_guardian():
	if selected_guardian:
		selected_guardian.position.y += 20
		selected_guardian = null

func raycast_slot ():
	var space_state = get_world_2d().direct_space_state;
	var parameters = PhysicsPointQueryParameters2D.new();
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD_SLOT
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		#print(result[0].collider.get_parent())
		return result[0].collider.get_parent()
	print("Empty space")
	return null;

func raycast ():
	var space_state = get_world_2d().direct_space_state;
	var parameters = PhysicsPointQueryParameters2D.new();
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		#print(result[0].collider.get_parent())
		return get_card_with_highest_z_index(result)
	print("Empty space")
	return null;


func on_left_click_released():
	print("Howdy")
	if card_being_dragged:
		finish_drag();


func get_card_with_highest_z_index(cards):
	var highest_z_card = cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index
	
	for i in range(1, cards.size()):
		var currentCard = cards[i].collider.get_parent()
		if currentCard.z_index > highest_z_index:
			highest_z_card = currentCard
			highest_z_index = currentCard.z_index
	return highest_z_card

func reset_guardian():
	played_guardian_card_this_turn = false
