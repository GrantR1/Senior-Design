extends Node2D

var card_in_slot = false;
var card_slot_type = "Guardian"
func _ready():
	print("card_in_slot: " + str(card_in_slot))  # Debugging to check if it's set correctly
