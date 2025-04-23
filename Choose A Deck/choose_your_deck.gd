class_name ChooseYourDeck
extends Control

@onready var exit_button = $Exit_Button as Button;
@onready var Deck_One = $"Deck_One" as Button;
@onready var Deck_Two = $"Deck_Two" as Button;
@onready var Deck_Three = $"Deck_Three" as Button;
@onready var Deck_Four = $"Deck_Four" as Button;
@onready var Confirm_Selection = $"Confirn_Selection" as Button;
@onready var deckInfoText = $"RichTextLabel" as RichTextLabel;
@onready var SceneTransitionAnimation = $SceneTransitionAnimation/AnimationPlayer;


var selection = null;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_button.button_down.connect(_on_exit_pressed);
	Confirm_Selection.button_down.connect(_on_Confirm_Selection_Pressed);
	Deck_One.button_down.connect(_on_Deck_One_Pressed);
	Deck_Two.button_down.connect(_on_Deck_Two_Pressed);
	Deck_Three.button_down.connect(_on_Deck_Three_Pressed);
	Deck_Four.button_down.connect(_on_Deck_Four_Pressed);
	set_process(false);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_exit_pressed() -> void:
	set_process(false);
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
	
func _on_Deck_One_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Student Deck\n
	Allies: Undergrad, The Professor, Study Buddy, Atilla the Duck\n
	Guardians: Stevens’ S.C. Williams Library, University Center Complex\n
	Spells: Grading Curve, Extra Credit, Prepared to Learn, Failed Test, 
	Honor Code Violation, Study Session");
	DeckVars.your_deck = "deck one"
	set_process(false);
	
func _on_Deck_Two_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Statistics Deck\n
	Allies: Teachers Assistant, The Professor, Moody Student\n
	Guardians: S.S. Stevens, Pop Quiz, Stevens Campus Police\n
	Spells: Extra Credit, Failed Test, Study Session, Tough Classes, 
	MA-222 Probability and Statistics, MA-623 Stochastic Processes");
	DeckVars.your_deck = "deck Two"
	set_process(false);
	
func _on_Deck_Three_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Mixed Deck\n
	Allies: Study Buddy, Atilla the Duck, Residential Advisor\n
	Guardians: S.S. Stevens, S.S Stevens Victory, Walker Gymnasium\n
	Spells: TI-Nspire Graphing Calculator, Failed Test, A+ Test, 
	Sleep Deprived, Tough Classes, Honor Code Violation");
	DeckVars.your_deck = "deck three"
	set_process(false);
	
func _on_Deck_Four_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("History Deck\n
	Allies: Edwin A. Stevens, William H. Peirce, Henry Morton\n
	Guardians: The Center for Maritime Systems at Stevens, 
	Stevens' S.C. Williams Library, Walker Gymnasium\n
	Spells: Charles V. Schaefer Jr. School of Engineering and Science, 
	National Center for Secure and Resilient, 
	Office of Innovation and Entrepreneurship, 
	The Center for Innovation in Engineering and Science Education (CIESE), 
	The Center for Environmental Systems (CES), 
	The Highly Filled Materials Institute (HfMI)");
	DeckVars.your_deck = "deck Four"
	set_process(false);

func _on_Confirm_Selection_Pressed() -> void:
	#get_tree().change_scene_to_file("res://ScenesandScripts/main.tscn");
	SceneTransitionAnimation.play("fade_in");
	await get_tree().create_timer(0.5).timeout;
	get_tree().change_scene_to_file("res://Intro/intro.tscn");
	set_process(false);
