class_name MainMenu
extends Control

@onready var start_button = $"VBoxContainer/Start Button" as Button;
@onready var about_button = $"VBoxContainer/About Button" as Button;
@onready var donate_button = $VBoxContainer/Donate as LinkButton;
#@onready var stevensDayOfGiving_button = $"MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Stevens Day of Giving" as LinkButton;
@onready var how_to_play_button = $"VBoxContainer/How To Play" as Button;
@onready var about_page = $About as About;
@onready var how_to_play = $"How To Play" as HowToPlay;
@onready var choose_your_deck = $"Choose A Deck" as ChooseYourDeck;
@onready var margin_container = $MarginContainer as MarginContainer;
@onready var leaderboard = $VBoxContainer/Leaderboard as Button;
@onready var donate_leaderboard = $VBoxContainer/Donate_Leaderboard as Button;
# Called when the node enters the scene tree for the first time.
func handle_connecting_signals() -> void:
	start_button.pressed.connect(_on_start_button_pressed);
	about_button.pressed.connect(_on_about_button_pressed);
	how_to_play_button.pressed.connect(_on_howToPlay_button_pressed);
	donate_button.pressed.connect(_on_donate_pressed);
	#stevensDayOfGiving_button.pressed.connect(_on_stevensDayOfDiving_website_pressed);
	about_page.exit_about.connect(_on_exit_about);
	how_to_play.exit_about.connect(_on_exit_howToPlay);
	#choose_your_deck.exit_about.connect(_on_exit_chooseYourDeck);
	leaderboard.pressed.connect(_on_leaderboard_pressed);
	donate_leaderboard.pressed.connect(_on_donate_leaderboard_pressed);
func _ready() -> void:
	if not MusicManager.playing:
		MusicManager.play()
	about_page.visible = false;
	handle_connecting_signals();

func _on_start_button_pressed() -> void:
	#Function for start button which will take 
	#the user to the first level of the game 
	
	#need to add path to scene file that will start the game
	#get_tree().change_scene_to_file(); #add path here
	print('Start Pressed');
	margin_container.visible = false;
	choose_your_deck.set_process(true);
	choose_your_deck.visible = true;



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

	OS.shell_open("https://give.stevens.edu/campaigns/40935/donations/");

func _on_stevensDayOfDiving_website_pressed() -> void:
	#Function for the stevens day of giving website button

	OS.shell_open("https://www.stevens.edu/events/stevens-day-of-giving");

func _on_exit_about() -> void:
	margin_container.visible = true;
	about_page.visible = false;
	
func _on_exit_chooseYourDeck() -> void:
	margin_container.visible = true;
	choose_your_deck.visible = false;

func _on_exit_howToPlay() -> void:
	margin_container.visible = true;
	how_to_play.visible = false;
	


func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/quiver_leaderboards/leaderboard_ui.tscn");


func _on_donate_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://Donations_Leaderboard/donations_leaderboard_ui.tscn");
