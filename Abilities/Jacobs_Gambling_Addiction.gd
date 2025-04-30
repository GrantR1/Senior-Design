extends Node
var rng = RandomNumberGenerator.new()
func attacking_ability(bm, attacker, defender):
	var dice_roll = rng.randi_range(1,6)
	print("You have rolled:", dice_roll)
	attacker.def = dice_roll
	attacker.get_node("Def").text = str(defender.def)
	print("defending ability triggered")
	pass
