extends Node

func defending_ability(battle_manager_reference,attacker, defender):
	var net = attacker.attack - 1
	print(net)
	if net <= 0:
		net = 0
	print(net)
	defender.def -= net
	defender.get_node("Def").text = str(defender.def)
	print("%s blocked 1 damage! net = %d, new DEF = %d" %[defender.name, net, defender.def])
	print("defending ability triggered")
	pass
