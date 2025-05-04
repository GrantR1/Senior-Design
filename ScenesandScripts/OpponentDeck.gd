extends Node2D

const CARD_SCENE_PATH = "res://ScenesandScripts/EnemyCard.tscn"
var opponent_deck = []
var original_deck = []
const STARTING_HAND_SIZE = 5
var card_database_reference
const CARD_DRAW_SPEED = .5
const MAX_HAND_SIZE = 7
const DECKS = {
	1: CardDatabase.CARDS,   # Assuming CARDS is the first deck (e.g., the "student deck")
	2: CardDatabase.CARDS2,  # Second deck
	3: CardDatabase.CARDS3,  # Third deck
	4: CardDatabase.CARDS4,  # Fourth deck
	5: CardDatabase.CARDS5   # Fifth deck
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()  # Ensures more random results across runs
	var chosen_deck_number = randi() % 5 + 1
	card_database_reference = DECKS[chosen_deck_number]
	for card_name in card_database_reference.keys():
		original_deck.append(card_name)
	opponent_deck = original_deck.duplicate()
	opponent_deck.shuffle()
	#$RichTextLabel.text = str(opponent_deck.size())
	#card_database_reference = preload("res://ScenesandScripts/CardDatabase.gd")
	for i in range(STARTING_HAND_SIZE):
		draw_card()
		


func draw_card():
	print("Pizza")
	if $"../EnemyHand".opponent_hand.size() >= MAX_HAND_SIZE:
		return
	get_node("../CardDrawnSound").play()
	var card_drawn_name = opponent_deck[0]
	opponent_deck.erase(card_drawn_name)
	
	if opponent_deck.size() == 0:
		opponent_deck = original_deck.duplicate()
		opponent_deck.shuffle()
	#$RichTextLabel.text = str(opponent_deck.size())
	
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Sprites/" + card_drawn_name + ".png")
	new_card.get_node("BackCard").texture = load(card_image_path)
	new_card.attack = card_database_reference[card_drawn_name][0]
	new_card.def = card_database_reference[card_drawn_name][1]
	new_card.get_node("Attack").text = str(new_card.attack)
	new_card.get_node("Def").text = str(new_card.def)
	#new_card.get_node("Cost").text = str(card_database_reference.CARDS[card_drawn_name][2])
	new_card.card_type = str(card_database_reference[card_drawn_name][3])
	var new_card_ability_script_path = card_database_reference[card_drawn_name][5]
	if new_card_ability_script_path:
		new_card.ability_script = load(new_card_ability_script_path).new()
	$"../Card Manager".add_child(new_card)
	new_card.name = "Card"
	$"../EnemyHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
