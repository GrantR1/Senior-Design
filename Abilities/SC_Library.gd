extends Node

func trigger_ability(bm, user):
	if user == "player":
		var player_deck = bm.get_node("../Deck")
		for i in range(2):
			player_deck.reset_draw()
			player_deck.draw_card()
		print("DrawTwoOnPlay: drew 2 cards for Player")
	else:
		var opponent_deck = bm.get_node("../OpponentDeck")
		for i in range(2):
			opponent_deck.draw_card()
		print("DrawTwoOnPlay: drew 2 cards for Opponent")
	print("ability triggered")
	pass
