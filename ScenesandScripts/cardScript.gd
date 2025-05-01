extends Node2D

signal hovered;
signal hovered_off

var hand_pos
var card_slot_card_in
var front_guardian_slot = null
var card_type
var def
var attack
var defeated = false
var ability_script
var card_description
var card_name
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect_card_signals(self); #all cards must be a child of child manager


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
