class_name MainMenu
extends Control

@onready var start_button = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Start Button" as Button;
@onready var about_button = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/About Button" as Button;
@onready var donate_button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Donate as Button;
@onready var how_to_play_button = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/How To Play" as Button;
@onready var about_page = $About as About;
@onready var how_to_play = $"How To Play" as HowToPlay;
@onready var margin_container = $MarginContainer as MarginContainer;

# Called when the node enters the scene tree for the first time.
func handle_connecting_signals() -> void:
	start_button.button_down.connect(_on_start_button_pressed);
	about_button.button_down.connect(_on_about_button_pressed);
	how_to_play_button.button_down.connect(_on_howToPlay_button_pressed);
	donate_button.button_down.connect(_on_donate_pressed);
	about_page.exit_about.connect(_on_exit_about);
	how_to_play.exit_about.connect(_on_exit_howToPlay);

func _ready() -> void:
	about_page.visible = false;
	handle_connecting_signals();

func _on_start_button_pressed() -> void:
	#Function for start button which will take 
	#the user to the first level of the game 
	
	#need to add path to scene file that will start the game
	#get_tree().change_scene_to_file(); #add path here
	print('Start Pressed');


func _on_about_button_pressed() -> void:
	#Function for the about button which will
	#take the user to the about page for the game
	margin_container.visible = false;
	about_page.set_process(true);
	about_page.visible = true;

func _on_howToPlay_button_pressed() -> void:
	#Function for the "how to play" button which will
	#take the user to the "how to play" page for the game
	margin_container.visible = false;
	how_to_play.set_process(true);
	how_to_play.visible = true;


func _on_donate_pressed() -> void:
	#Function for the donate button which will 
	#take the user to the website to donate
	
	print('Donate Pressed');

func _on_exit_about() -> void:
	margin_container.visible = true;
	about_page.visible = false;

func _on_exit_howToPlay() -> void:
	margin_container.visible = true;
	how_to_play.visible = false;
	
