extends Node2D

const COLLISION_MASK_CARD = 1

var screen_size;
var card_being_dragged;
var is_hovering_on_card;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(clamp(mouse_pos.x,0,screen_size.x), clamp(mouse_pos.y,0,screen_size.y))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

func connect_card_signals(card):
	card.connect("hovered", on_hovered_over_card)
	card.connect("hovered_off", on_hovered_off_card)

func on_hovered_over_card(card):
	if !is_hovering_on_card:
		is_hovering_on_card = true
		highlight_card(card, true);

func on_hovered_off_card(card):
	#check if hovered off 1 card and strait onto another
	if !card_being_dragged:
		highlight_card(card,false)
		var new_card_hovered = raycast()
		if new_card_hovered:
			highlight_card(new_card_hovered, true)
		else:
			is_hovering_on_card = false

func highlight_card(card, hovered):
	if hovered:
		card.scale = Vector2(1.05, 1.05)
		card.z_index = 2
	else:
		card.scale = Vector2(1, 1)
		card.z_index = 1

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card = raycast()
			if card:
				start_drag(card)
			
		else:
			finish_drag();
			print("Release");

func start_drag(card):
	card_being_dragged = card
	card.scale = Vector2(1, 1)
func finish_drag():
	card_being_dragged.scale = Vector2(1.05, 1.05)
	card_being_dragged = null;
	
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
	
func get_card_with_highest_z_index(cards):
	var highest_z_card = cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index
	
	for i in range(1, cards.size()):
		var currentCard = cards[i].collider.get_parent()
		if currentCard.z_index > highest_z_index:
			highest_z_card = currentCard
			highest_z_index = currentCard.z_index
	return highest_z_card
