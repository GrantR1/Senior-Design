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
	#match DeckVars.your_deck:
		#"deck one": #for testing purposes
			#original_deck = ["Teachers Assistant", "The Professor",
			#"Moody Student", "SS Stevens victory", "Henry Morton",
			#"University Center Complex", "Sleep Deprived"]
		#"deck one": #Student Deck
			#original_deck = ["Undergrad", "The Professor",
			#"Study Buddy", "Atilla the Duck", "Stevens' S.C. Williams Library", 
			#"University Center Complex", "Grading Curve", "Extra Credit",
			#"Prepared to Learn", "Failed Test", "Honor Code Validation", "Study Session"]
		#"deck Two": #Statistics
			#original_deck = ["Teachers Assistant", "The Professor", 
			#"Moody Student", "S.S. Stevens", "Pop Quiz",
			#"Stevens Campus Police", "Extra Credit", "Failed Test",
			#"Study Session", "Tough Classes", "MA-222 Probability and Statistics",
			#"MA-623 Stochastic Processes"]
		#"deck three": #Mixed
			#original_deck = ["Study Buddy", "Atilla the Duck", 
			#"S.S. Stevens", "SS Stevens victory", "Walker Gymnasium",
			#"TI-Nspire Graphing Calculator", "Failed Test", "A+ Test",
			#"Sleep Deprived", "Tough Classes", "Honor Code Violation"]
		#"deck Four": #History
			#original_deck = ["Edwin A. Stevens", "William H. Perice",
			#"The Center for Maritime Systems at Stevens", "Stevens' S.C. Williams Library", 
			#"Walker Gymnasium", "Charles V. Schaefer Jr. School of Engineering and Science", 
			#"National Center for Secure and Resilient", "Office of Innovation and Entrepreneruship", 
			#"The Center for Innovation in Engineering and Science Education", 
			#"The Center for Environmental Systems", "The Highly Filled Materials Institute"]
	
	for card_name in CardDatabase.CARDS.keys():
		original_deck.append(card_name)
	print("Deck selected: ", DeckVars.your_deck)
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
