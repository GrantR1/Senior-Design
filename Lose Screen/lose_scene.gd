extends Control

func _ready():
	pass


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn");


func _on_stevens_day_of_giving_pressed() -> void:
	OS.shell_open("https://www.stevens.edu/events/stevens-day-of-giving");


func _on_donate_pressed() -> void:
	OS.shell_open("https://give.stevens.edu/2025-day-of-giving");
