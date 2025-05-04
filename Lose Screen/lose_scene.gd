extends Control

func _ready():
	if not MusicManager.playing:
		MusicManager.play()


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Choose A Deck/choose_your_deck.tscn");


func _on_donate_pressed() -> void:
	OS.shell_open("https://give.stevens.edu/campaigns/40935/donations/");
