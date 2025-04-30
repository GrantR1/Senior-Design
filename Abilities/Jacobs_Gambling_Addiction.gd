extends Node
var rng = RandomNumberGenerator.new()
func attacking_ability(bm, attacker, defender):
	var dice_roll = rng.randf_range(1,6)
	print("You have rolled:", dice_roll)
	defender.def = dice_roll
	defender.get_node("Def").text = str(defender.def)
	print("defending ability triggered")
	pass
