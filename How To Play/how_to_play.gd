class_name HowToPlay
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Exit_Button as Button;
@onready var help_text = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/RichTextLabel as RichTextLabel;


signal exit_about;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_button.button_down.connect(_on_exit_pressed);
	help_text.meta_clicked.connect(_on_help_link_clicked);
	set_process(false);

func _on_exit_pressed() -> void:
	exit_about.emit();
	set_process(false);

func _on_help_link_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta));
