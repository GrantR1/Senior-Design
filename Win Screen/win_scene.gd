extends Control

var player_name
var score
var donations_leaderboard_id = "stevens-day-of-givin-donations-vW2I"

const foundations := [
	"Foundation 1",
	"Foundation 2",
	"Foundation 3",
	"Foundation 4",
	"Foundation 5"
]
var has_voted = false

@onready var submit_button = $VBoxContainer2/Submit as Button
@onready var name_confirmation = $Name_Confirmation as Label
@onready var show_score = $Score as Label
@onready var drop_down = $OptionButton
@onready var submit_vote_button = $Submit_vote as Button
@onready var vote_confirmation = $VoteConfirmation as Label

func _ready():
	add_items()
	vote_confirmation.visible = false
	if not MusicManager.playing:
		MusicManager.play()
	score = global.final_turn_count
	if score != null and score != 0:
		print(score);
		show_score.text = "Score: " + str(score) + ' turns'

func add_items():
	for i in range(foundations.size()):
		drop_down.add_item(foundations[i])

func _on_submit_pressed() -> void:
	if($VBoxContainer2/LineEdit.text!= ""):
		player_name = $VBoxContainer2/LineEdit.text
		
		await Leaderboards.post_guest_score("stevens-day-of-givin-leaderboard-Vyng", score, player_name)
		submit_button.visible = false
		name_confirmation.text = "Name saved successfully!"
		name_confirmation.visible = true
		PlayerAccounts.log_out()

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Choose A Deck/choose_your_deck.tscn");


func _on_donate_pressed() -> void:
	OS.shell_open("https://give.stevens.edu/campaigns/40935/donations/");

func _on_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.

func get_current_score(foundation_name):
	var data = await Leaderboards.get_scores(donations_leaderboard_id, 0, 5)
	var found_foundation = false
	if data["scores"].size() == 0:
		return 0
	for s in data["scores"]:
		if s.has("name") and s["name"] == foundation_name:
			found_foundation = true
			return int(s["score"])
	if(found_foundation == false):
		return 0

func _on_submit_vote_pressed() -> void:
	if has_voted:
		print("You have already voted")
		return
	
	var selected_index = drop_down.get_selected()
	var selected_foundation = drop_down.get_item_text(selected_index)
	
	if(selected_foundation == "Foundation 1"):
		var current_score = await get_current_score("Foundation 1")
		if(current_score > 0):
			await Leaderboards.post_guest_score(donations_leaderboard_id, current_score + 1, selected_foundation)
		else:
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, selected_foundation)
	if(selected_foundation == "Foundation 2"):
		var current_score = await get_current_score("Foundation 2")
		if(current_score > 0):
			await Leaderboards.post_guest_score(donations_leaderboard_id, current_score + 1, selected_foundation)
		else:
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, selected_foundation)
	if(selected_foundation == "Foundation 3"):
		await Leaderboards.post_guest_score(donations_leaderboard_id, 1, selected_foundation)
	if(selected_foundation == "Foundation 4"):
		await Leaderboards.post_guest_score(donations_leaderboard_id, 1, selected_foundation)
	if(selected_foundation == "Foundation 5"):
		await Leaderboards.post_guest_score(donations_leaderboard_id, 1, selected_foundation)
	
	has_voted = true
	submit_vote_button.visible = false
	vote_confirmation.text = "You have successfully voted for " + selected_foundation
	vote_confirmation.visible = true
