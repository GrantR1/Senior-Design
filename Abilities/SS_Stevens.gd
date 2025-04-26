extends Node

func trigger_ability(battle_manager_reference):
	print("ability triggered")
	pass
func attacking_ability():
	print("attacking ability triggered")
	pass

func defending_ability(battle_manager_reference,attacker, defender):
	var net = attacker.attack - 1
	defender.def -= net
	defender.get_node("Def").text = str(defender.def)
	print("%s blocked 1 damage! net = %d, new DEF = %d" %[defender.name, net, defender.def])
	print("defending ability triggered")
	pass
