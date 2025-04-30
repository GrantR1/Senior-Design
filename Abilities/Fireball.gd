extends Node

func trigger_ability(bm, user):
	print(bm.player_health)
	bm.player_health = bm.player_health - 1
	print(bm.player_health)
	print("ability triggered")
	pass
