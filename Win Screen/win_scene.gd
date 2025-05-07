extends Control

var player_name
var score
var donations_leaderboard_id = "stevens-day-of-givin-donations-vW2I"

var has_voted = false

@onready var submit_button = $VBoxContainer2/Submit as Button
@onready var name_confirmation = $Name_Confirmation as Label
@onready var show_score = $Score as Label
@onready var drop_down = $OptionButton
@onready var submit_vote_button = $Submit_vote as Button
@onready var vote_confirmation = $VoteConfirmation as Label
@onready var submit_vote_button_2 = $Submit_voteTwo as Button
@onready var vote_confirmation_2 = $VoteConfirmation_Two as Label

var selected_foundation

func _ready():
	if not MusicManager.playing:
		MusicManager.play()
	score = global.final_turn_count
	if score != null and score != 0:
		print(score);
		show_score.text = "Score: " + str(score) + ' turns'



func _on_submit_pressed() -> void:
	if($VBoxContainer2/LineEdit.text!= ""):
		player_name = $VBoxContainer2/LineEdit.text
		
		await Leaderboards.post_guest_score("stevens-day-of-givin-leaderboard-Vyng", score, player_name)
		submit_button.visible = false
		name_confirmation.text = "Name saved successfully!"
		name_confirmation.visible = true

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Choose A Deck/choose_your_deck.tscn");


func _on_donate_pressed() -> void:
	OS.shell_open("https://give.stevens.edu/campaigns/40935/donations/");


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

func vote_action() -> void:
	if has_voted:
		print("You have already voted")
		return
	
	var selected_index = drop_down.get_selected()
	selected_foundation = drop_down.get_item_text(selected_index)
	
	if(selected_foundation == "The Stevens Fund"):
		var current_score = await get_current_score("The Stevens Fund")
		if(current_score > 0):
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Stevens Fund")
		else:
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Stevens Fund")
	if(selected_foundation == "Stevens Scholarship Fund"):
		var current_score = await get_current_score("Stevens Scholarship Fund")
		if(current_score > 0):
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Scholarship")
		else:
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Scholarship")
	if(selected_foundation == "Stevens Student Emergency Fund"):
		var current_score = await get_current_score("Stevens Student Emergency Fund")
		if(current_score > 0):
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Emergency Fund")
		else:
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Emergency Fund")
	if(selected_foundation == "Impact Assistance Term Scholarship Fund"):
		var current_score = await get_current_score("Impact Assistance Term Scholarship Fund")
		if(current_score > 0):
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Assistance Fund")
		else:
			await Leaderboards.post_guest_score(donations_leaderboard_id, 1, "Assistance Fund")
	
	has_voted = true
	
func _on_submit_vote_pressed() -> void:
	vote_action()
	submit_vote_button.visible = false
	vote_confirmation.text = "You have successfully voted for " + selected_foundation
	vote_confirmation.visible = true


func _on_submit_vote_two_pressed() -> void:
	vote_action()
	submit_vote_button_2.visible = false
	vote_confirmation_2.text = "You have successfully voted for " + selected_foundation
	vote_confirmation_2.visible = true
