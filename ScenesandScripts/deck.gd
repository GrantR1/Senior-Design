extends Node2D

const CARD_SCENE_PATH = "res://ScenesandScripts/Card.tscn"
var player_deck = []
var original_deck = []
const STARTING_HAND_SIZE = 5
var card_database_reference
const CARD_DRAW_SPEED = .5
var drawn_card_this_turn = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match DeckVars.your_deck:
		"deck one": #Student Deck
			for card_name in CardDatabase.CARDS.keys():
				original_deck.append(card_name)
		"deck Two": #Statistics
			for card_name in CardDatabase.CARDS3.keys():
				original_deck.append(card_name)
		"deck three": #Mixed
			for card_name in CardDatabase.CARDS4.keys():
				original_deck.append(card_name)
		"deck Four": #History
			for card_name in CardDatabase.CARDS5.keys():
				original_deck.append(card_name)
	
	#for card_name in CardDatabase.CARDS.keys():
		#original_deck.append(card_name)
	
	player_deck = original_deck.duplicate()
	player_deck.shuffle()
	#$RichTextLabel.text = str(player_deck.size())
	card_database_reference = preload("res://ScenesandScripts/CardDatabase.gd")
	for i in range(STARTING_HAND_SIZE):
		draw_card()
		drawn_card_this_turn = false
	drawn_card_this_turn = true


func draw_card():
	print("Pizza")
	if drawn_card_this_turn:
		return
	drawn_card_this_turn = true;
	var card_drawn_name = player_deck[0]
	player_deck.erase(card_drawn_name)
	
	if player_deck.size() == 0:
		player_deck = original_deck.duplicate()
		player_deck.shuffle()
	#$RichTextLabel.text = str(player_deck.size())
	
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Sprites/" + card_drawn_name + ".png")
	new_card.get_node("BackCard").texture = load(card_image_path)
	new_card.card_type = str(card_database_reference.CARDS[card_drawn_name][3])
	new_card.def = card_database_reference.CARDS[card_drawn_name][1]
	new_card.attack = card_database_reference.CARDS[card_drawn_name][0]
	new_card.get_node("Attack").text = str(new_card.attack)
	new_card.get_node("Def").text = str(new_card.def)
	new_card.get_node("Cost").text = str(card_database_reference.CARDS[card_drawn_name][2])
	var new_card_ability_script_path = card_database_reference.CARDS[card_drawn_name][5]
	if new_card_ability_script_path:
		new_card.ability_script = load(new_card_ability_script_path).new()
	
	$"../Card Manager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
	new_card.get_node("AnimationPlayer").play("card_flip")
func reset_draw():
	drawn_card_this_turn = false
