class_name ChooseYourDeck
extends Control

@onready var exit_button = $Exit_Button as Button;
@onready var Deck_One = $"Deck_One" as Button;
@onready var Deck_Two = $"Deck_Two" as Button;
@onready var Deck_Three = $"Deck_Three" as Button;
@onready var Deck_Four = $"Deck_Four" as Button;
@onready var Confirm_Selection = $"Confirn_Selection" as Button;
@onready var deckInfoText = $"RichTextLabel" as RichTextLabel;

var selection = null;

signal exit_about;
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
	exit_about.emit();
	set_process(false);
	
func _on_Deck_One_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Deck One Info");
	set_process(false);
	
func _on_Deck_Two_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Deck Two Info");
	set_process(false);
	
func _on_Deck_Three_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Deck Three Info");
	set_process(false);
	
func _on_Deck_Four_Pressed() -> void:
	deckInfoText.clear();
	deckInfoText.add_text("Deck Four Info");
	set_process(false);

func _on_Confirm_Selection_Pressed() -> void:
	set_process(false);
