extends Control

func _ready():
	pass


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn");


func _on_donate_pressed() -> void:
	OS.shell_open("https://give.stevens.edu/campaigns/40935/donations/");
