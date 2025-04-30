extends Node

func trigger_ability(bm, user):
	if user == "opponent":
		print(bm.player_health)
		bm.player_health = bm.player_health - 1
		print(bm.player_health)
	else:
		print(bm.opponent_health)
		bm.opponent_health = bm.opponent_health - 1
		print(bm.opponent_health)
	print("ability triggered")
	pass
