extends Node2D

const CARD_SCENE_PATH = "res://ScenesandScripts/EnemyCard.tscn"
var opponent_deck = ["Teachers Assistant", "The Professor", "Moody Student", "SS Stevens victory","Henry Morton", "University Center Complex", "Sleep Deprived"]
const STARTING_HAND_SIZE = 5
var card_database_reference
const CARD_DRAW_SPEED = .5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	opponent_deck.shuffle()
	$RichTextLabel.text = str(opponent_deck.size())
	card_database_reference = preload("res://ScenesandScripts/CardDatabase.gd")
	for i in range(STARTING_HAND_SIZE):
		draw_card()
		


func draw_card():
	print("Pizza")
	
	var card_drawn_name = opponent_deck[0]
	opponent_deck.erase(card_drawn_name)
	
	if opponent_deck.size() == 0:
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	$RichTextLabel.text = str(opponent_deck.size())
	
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Sprites/" + card_drawn_name + ".png")
	new_card.get_node("BackCard").texture = load(card_image_path)
	new_card.attack = card_database_reference.CARDS[card_drawn_name][0]
	new_card.get_node("Attack").text = str(new_card.attack)
	new_card.get_node("Def").text = str(card_database_reference.CARDS[card_drawn_name][1])
	new_card.get_node("Cost").text = str(card_database_reference.CARDS[card_drawn_name][2])
	new_card.card_type = str(card_database_reference.CARDS[card_drawn_name][3])
	$"../Card Manager".add_child(new_card)
	new_card.name = "Card"
	$"../EnemyHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
