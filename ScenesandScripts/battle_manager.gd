extends Node
var battle_timer
var empty_guardian_card_slot = []

const SMALL_CARD_SCALE = 0.5
const CARD_SPEED = 0.2
func _ready () -> void:
	battle_timer = $"../BattleTimer"
	battle_timer.one_shot = true
	battle_timer.wait_time = 1.0
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot5")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot6")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot7")
	empty_guardian_card_slot.append($"../CardSlots/EnemyCardslot8")

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
	if empty_guardian_card_slot.size() == 0:
		end_opponent_turn()
		return
	await try_play_card_attack()
	end_opponent_turn()
func try_play_card_attack():
	var opponent_hand = $"../EnemyHand".opponent_hand
	if opponent_hand.size() == 0:
		end_opponent_turn()
		return
	var random_guardian_card_slot = empty_guardian_card_slot[randi_range(-1, empty_guardian_card_slot.size())]
	empty_guardian_card_slot.erase(random_guardian_card_slot)
	
	var card_highest_attack = opponent_hand[0]
	for card in opponent_hand:
		if card.attack > card_highest_attack.attack:
			card_highest_attack = card
	var tween = get_tree().create_tween()
	tween.tween_property(card_highest_attack, "position", random_guardian_card_slot.position, CARD_SPEED)
	var tween2 = get_tree().create_tween()
	tween2.tween_property(card_highest_attack, "scale", Vector2(SMALL_CARD_SCALE, SMALL_CARD_SCALE), CARD_SPEED)
	card_highest_attack.get_node("AnimationPlayer").play("card_flip")
	$"../EnemyHand".remove_card(card_highest_attack)
	battle_timer.start()
	await battle_timer.timeout

func _on_end_turn_button_pressed() -> void:
	opponent_turn ()
	
func end_opponent_turn():
	#play a card w/ highest attack
	$"../Deck".reset_draw()
	$"../Card Manager".reset_guardian()
	$"../EndTurnButton".disabled = false
	$"../EndTurnButton".visible = true
