extends Node

func trigger_ability(bm, user):
	if user == "player":
		if bm.player_health == 10:
			print("max hp no heal for you")
			pass
		else:
			print(bm.player_health)
			bm.player_health = bm.player_health + 1
			print(bm.player_health)
	else:
		if bm.opponent_health == 10:
			print("max hp no heal for you")
			pass
		else:
			print(bm.opponent_health)
			bm.opponent_health = bm.opponent_health + 1
			print(bm.opponent_health)
	print("ability triggered")
	pass
