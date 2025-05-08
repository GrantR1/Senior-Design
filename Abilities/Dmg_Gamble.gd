extends Node
var rng = RandomNumberGenerator.new()
func attacking_ability(bm, attacker, defender):
	var dice_roll = rng.randi_range(1,6)
	if dice_roll == 5 or dice_roll == 6:
		print("This should not change before", defender.def);
		attacker.def = attacker.def - 1
		attacker.get_node("Def").text = str(attacker.def)
		print("This should not change after", defender.def);
		print("aw dang it")
	else:
		print("original value", defender.def)
		print("attack", attacker.attack)
		print("calculation", attacker.attack * 2 - defender.def)
		if (attacker.attack * 2) > defender.def:
			defender.def = 0
		else:
			defender.def = defender.def - (attacker.attack * 2)
		#defender.def = attacker.attack * 2 - defender.def
		print("later value", defender.def)
		print()
		defender.get_node("Def").text = str(defender.def)
		print("I CANT STOP WINNING")
	print("attacking ability triggered")
	pass
