extends Node2D

const CARD_SCENE_PATH = "res://ScenesandScripts/Card.tscn"
var player_deck = ["Teachers Assistant", "The Professor", "Moody Student"]
var card_database_reference
const CARD_DRAW_SPEED = .5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck.shuffle()
	$RichTextLabel.text = str(player_deck.size())
	card_database_reference = preload("res://ScenesandScripts/CardDatabase.gd")



func draw_card():
	print("Pizza")
	var card_drawn_name = player_deck[0]
	player_deck.erase(card_drawn_name)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	$RichTextLabel.text = str(player_deck.size())
	
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Sprites/" + card_drawn_name + ".png")
	new_card.get_node("BackCard").texture = load(card_image_path)
	new_card.get_node("Attack").text = str(card_database_reference.CARDS[card_drawn_name][0])
	new_card.get_node("Def").text = str(card_database_reference.CARDS[card_drawn_name][1])
	new_card.get_node("Cost").text = str(card_database_reference.CARDS[card_drawn_name][2])
	$"../Card Manager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
