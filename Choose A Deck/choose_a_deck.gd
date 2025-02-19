class_name ChooseADeck
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Exit_Button as Button;
signal exit_about;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_button.button_down.connect(_on_exit_pressed);
	set_process(false);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_exit_pressed() -> void:
	exit_about.emit();
	set_process(false);
