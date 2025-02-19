extends Node2D

const CARD_WIDTH = 200
const HAND_Y_POS = 700
var player_hand = []
var center_screen_x
const DEFAULT_CARD_SPEED = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	center_screen_x = get_viewport().size.x / 2

func add_card_to_hand(card, speed):
	if card not in player_hand:
		player_hand.insert(0, card)
		update_hand_positions(speed)
	else:
		animate_card(card, card.hand_pos, DEFAULT_CARD_SPEED)
func update_hand_positions(speed):
	for i in range(player_hand.size()):
		var new_position = Vector2(calculate_card_position(i), HAND_Y_POS)
		var card = player_hand[i]
		card.hand_pos = new_position
		animate_card(card, new_position, speed)

func animate_card(card, new_pos, speed):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", new_pos, speed)


func calculate_card_position(index):
	var total_width = (player_hand.size()-1) * CARD_WIDTH
	var x_offset = center_screen_x + index * CARD_WIDTH - total_width / 2
	return x_offset

func remove_card(card):
	if card in player_hand:
		player_hand.erase(card)
		update_hand_positions(DEFAULT_CARD_SPEED)
