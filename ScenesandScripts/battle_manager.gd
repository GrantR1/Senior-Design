extends Node
var battle_timer
const STARTING_HEALTH = 10
const BATTLE_POS_OFFSET = 25
var empty_guardian_card_slot = []
var empty_spell_card_slot = []
var opponent_cards_on_battlefield = []
var player_cards_on_battlefield = []
var player_cards_that_attacked_this_turn = []
var player_health
var opponent_health
var is_opponent_turn = false
var player_is_attacking = false

const SMALL_CARD_SCALE = 0.5
const CARD_SPEED = 0.2
func _ready () -> void:
	battle_timer = $"../BattleTimer"
	battle_timer.one_shot = true
	battle_timer.wait_time = 1.0
	empty_spell_card_slot.append($"../CardSlots/EnemyCardslot")
	empty_spell_card_slot.append($"../CardSlots/EnemyCardslot2")
	empty_spell_card_slot.append($"../CardSlots/EnemyCardslot3")
	empty_spell_card_slot.append($"../CardSlots/EnemyCardslot4")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot5")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot6")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot7")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot8")
	player_health = STARTING_HEALTH
	$"../PlayerHealth".text = str(player_health)
	opponent_health = STARTING_HEALTH
	$"../OpponentHealth".text = str(opponent_health)

func opponent_turn ():
	$"../EndTurnButton".disabled = true
	$"../EndTurnButton".visible = false
	battle_timer.start()
	await battle_timer.timeout
	if $"../OpponentDeck".opponent_deck.size() != 0:
		$"../OpponentDeck".draw_card()
		battle_timer.start()
		await battle_timer.timeout
	#wait 1 second
	if empty_guardian_card_slot.size() != 0:
		await try_play_card_attack()
	#if any opponents cards to attack
	if opponent_cards_on_battlefield.size() != 0:
		var dupe = opponent_cards_on_battlefield.duplicate()
		for card in dupe:
			if player_cards_on_battlefield.size() != 0:
				#attack
				var card_to_attack = player_cards_on_battlefield.pick_random()
				await attack(card, card_to_attack, "Opponent")
			else:
				#preform direct attack
				await direct_attack(card, "Opponent")
				
	end_opponent_turn()
func direct_attack(attacking_card, Attacker):
	print("Direct Hit")
	if attacking_card.card_type == "Spell":
		var new_pos_y
		if Attacker == "Opponent":
			new_pos_y = 1080
		else:
			$"../EndTurnButton".disabled = true
			$"../EndTurnButton".visible = false
			player_is_attacking = true
			new_pos_y = 0
			player_cards_that_attacked_this_turn.append(attacking_card)
		var new_pos = Vector2(attacking_card.position.x,new_pos_y)
		attacking_card.z_index = 5
		var tween = get_tree().create_tween()
		tween.tween_property(attacking_card, "position", new_pos, CARD_SPEED)
		await wait(0.15)
		if Attacker == "Opponent":
			
			player_health = max(0,player_health - attacking_card.attack)
			$"../PlayerHealth".text = str(player_health)
		else:
			opponent_health = max(0,opponent_health - attacking_card.attack)
			$"../OpponentHealth".text = str(opponent_health)
		var tween2 = get_tree().create_tween()
		tween2.tween_property(attacking_card, "position", attacking_card.card_slot_card_in.position, CARD_SPEED)
		attacking_card.z_index = 0
		await wait(1)
		if Attacker == "Player":
			player_is_attacking = false
			$"../EndTurnButton".disabled = false
			$"../EndTurnButton".visible = true
	
func attack(attacking_card, defending_card, attacker):
	if attacking_card.card_type == "Guardian":
		return
	if attacker == "Player":
		player_is_attacking = true
		$"../EndTurnButton".disabled = true
		$"../EndTurnButton".visible = false
		$"../Card Manager".selected_guardian = null
		player_cards_that_attacked_this_turn.append(attacking_card)
	if attacking_card.card_type == "Spell":
		attacking_card.z_index = 5
		var newPosit = Vector2(defending_card.hand_pos.x, defending_card.hand_pos.y + BATTLE_POS_OFFSET)
		var tween = get_tree().create_tween()
		tween.tween_property(attacking_card, "position", newPosit, CARD_SPEED)
		await wait(0.15)
		var tween2 = get_tree().create_tween()
		tween2.tween_property(attacking_card, "position", attacking_card.card_slot_card_in.position, CARD_SPEED)
		#card damage
		defending_card.def = max(0,defending_card.def - attacking_card.attack)
		defending_card.get_node("Def").text = str(defending_card.def)
		
		attacking_card.def = max(0,attacking_card.def - defending_card.attack)
		attacking_card.get_node("Def").text = str(attacking_card.def)
		await wait(1)
		attacking_card.z_index = 0
		var card_was_destroyed = false
		#destroy cards if def = 0
		if attacking_card.def == 0:
			destroy_card(attacking_card, attacker)
			card_was_destroyed = true
		if defending_card.def == 0: #might have to change this
			if attacker == "Player":
				destroy_card(defending_card, "Opponent")
			else:
				destroy_card(defending_card, "Player")
			card_was_destroyed = true
		if card_was_destroyed:
			await wait(1)
	if attacker == "Player":
		player_is_attacking = false
		$"../EndTurnButton".disabled = false
		$"../EndTurnButton".visible = true
func enemy_card_selected(defending_card):
	var attacking_card = $"../Card Manager".selected_guardian
	if attacking_card:
		if defending_card in opponent_cards_on_battlefield:
			if player_is_attacking == false:
				$"../Card Manager".selected_guardian = null
				attack(attacking_card, defending_card, "Player")
		
func destroy_card(card, card_owner):
	var newPosit
	if card_owner == "Player":
		card.defeated = true
		card.get_node("Area2D/CollisionShape2D").disabled = true
		newPosit = $"../PlayerDiscard".position
		if card in player_cards_on_battlefield:
			player_cards_on_battlefield.erase(card)
		card.card_slot_card_in.get_node("Area2D/CollisionShape2D").disabled = false
	else:
		newPosit = $"../OponentDiscard".position
		if card in opponent_cards_on_battlefield:
			opponent_cards_on_battlefield.erase(card)
			if card.card_slot_card_in.card_slot_type == "Spell":
				empty_spell_card_slot.append(card.card_slot_card_in)
			else:
				empty_guardian_card_slot.append(card.card_slot_card_in)
	print("HUHHHH")
	card.card_slot_card_in.card_in_slot = false #error hmm
	#print(card.card_slot_card_in.get_class())
	card.card_slot_card_in = null
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", newPosit, CARD_SPEED)
	
func try_play_card_attack():
	var opponent_hand = $"../EnemyHand".opponent_hand
	if opponent_hand.size()==0:
		end_opponent_turn()
		return
	
	var card_to_play = opponent_hand[0]
	for card in opponent_hand:
		if card.attack > card_to_play.attack and card.card_type != "Guardian":
			card_to_play = card
	
	var pick_slot
	if card_to_play.card_type == "Spell":
		pick_slot = empty_spell_card_slot[randi_range(0, empty_spell_card_slot.size()-1)]
		empty_spell_card_slot.erase(pick_slot)
	elif card_to_play.card_type == "Guardian":
		pick_slot = empty_guardian_card_slot[randi_range(0, empty_guardian_card_slot.size()-1)]
		empty_guardian_card_slot.erase(pick_slot)
	else:
		end_opponent_turn()
		return
	
	var tween = get_tree().create_tween()
	tween.tween_property(card_to_play, "position", pick_slot.position, CARD_SPEED)
	var tween2 = get_tree().create_tween()
	tween2.tween_property(card_to_play, "scale", Vector2(SMALL_CARD_SCALE, SMALL_CARD_SCALE), CARD_SPEED)
	
	card_to_play.get_node("AnimationPlayer").play("card_flip")
	$"../EnemyHand".remove_card(card_to_play)
	
	card_to_play.card_slot_card_in = pick_slot
	opponent_cards_on_battlefield.append(card_to_play)
	
	await wait(1)

func _on_end_turn_button_pressed() -> void:
	is_opponent_turn = true
	$"../Card Manager".unselect_selected_guardian()
	player_cards_that_attacked_this_turn = []
	opponent_turn ()
func wait(wait_time):
	battle_timer.wait_time = wait_time
	battle_timer.start()
	await battle_timer.timeout
func end_opponent_turn():
	#play a card w/ highest attack
	$"../Deck".reset_draw()
	$"../Card Manager".reset_guardian()
	is_opponent_turn = false
	$"../EndTurnButton".disabled = false
	$"../EndTurnButton".visible = true
