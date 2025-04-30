extends Node

var max_defense_possible = 5

func attacking_ability(bm, attacker, defender):
	attacker.def = min(attacker.def + 1, max_defense_possible)
	attacker.get_node("Def").text = str(attacker.def)
	
	print("%s’s attack ability: +1 DEF (now %d / %d)" %[attacker.name, attacker.def, max_defense_possible])
	print("attacking ability triggered")
	pass
