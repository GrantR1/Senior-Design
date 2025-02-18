extends Node2D

const CARD_SCENE_PATH = "res://ScenesandScripts/Card.tscn"
var player_deck = ["Gambling", "Gambling", "Gambling"]
const CARD_DRAW_SPEED = .5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.text = str(player_deck.size())
	pass # Replace with function body.



func draw_card():
	print("Pizza")
	var card_drawn = player_deck[0]
	player_deck.erase(card_drawn)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	$RichTextLabel.text = str(player_deck.size())
	
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	$"../Card Manager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
