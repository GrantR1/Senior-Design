extends Control

var player_name
var score
@onready var submit_button = $VBoxContainer2/Submit as Button
@onready var name_confirmation = $Name_Confirmation as Label
@onready var show_score = $Score as Label

func _ready():
	score = global.final_turn_count
	show_score.text = "Score: " + str(score)

func _on_submit_pressed() -> void:
	if($VBoxContainer2/LineEdit.text!= ""):
		player_name = $VBoxContainer2/LineEdit.text
		#SilentWolf.Scores.save_score(player_name, score)
		await Leaderboards.post_guest_score("stevens-day-of-givin-leaderboard-Vyng", score, player_name)
		submit_button.visible = false
		name_confirmation.text = "Name saved successfully!"
		name_confirmation.visible = true

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Choose A Deck/choose_your_deck.tscn");


func _on_donate_pressed() -> void:
	OS.shell_open("https://give.stevens.edu/campaigns/40935/donations/");
