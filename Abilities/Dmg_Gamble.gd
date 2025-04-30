extends Node
var rng = RandomNumberGenerator.new()
func attacking_ability(bm, attacker, defender):
	var dice_roll = rng.randi_range(1,6)
	if dice_roll == 5 or dice_roll == 6:
		attacker.def = attacker.def - 1
		attacker.get_node("Def").text = str(attacker.def)
		print("aw dang it")
	else:
		defender.def = attacker.attack * 2 - defender.def
		defender.get_node("Def").text = str(defender.def)
		print("I CANT STOP WINNING")
	print("attacking ability triggered")
	pass
