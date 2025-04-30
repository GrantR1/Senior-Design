extends Node
var rng = RandomNumberGenerator.new()
func defending_ability(bm, attacker, defender):
	var dice_roll = rng.randi_range(1,6)
	print("You have rolled:", dice_roll)
	if dice_roll == 5 or dice_roll == 6:
		pass
	else:
		defender.def = max(0,defender.def - attacker.attack)
		defender.get_node("Def").text = str(defender.def)
	print("You have gambled, here is the outcome: ",dice_roll," ", defender.def)
	pass
