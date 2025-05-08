extends Node2D

signal hovered;
signal hovered_off

var hand_pos
var card_slot_card_in
var card_type
var front_guardian_slot = null
var attack
var def
var defeated = false
var ability_script
var card_description
var card_name
var is_enemy = true
func _ready() -> void:
	$Area2D.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	$Area2D.connect("mouse_exited", Callable(self, "_on_mouse_exited"))

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_mouse_exited() -> void:
	emit_signal("hovered_off", self)
