extends Node
func trigger_ability(battle_manager_reference, user):
	if user == "player":
		for card in battle_manager_reference.player_cards_on_battlefield:
			card.attack = max(0, card.attack + 1)
			card.get_node("Attack").text = str(card.attack)
			if card.attack < 0:
				card.attack = 0
	else:
		for card in battle_manager_reference.opponent_cards_on_battlefield:
			card.attack = max(0, card.attack + 1)
			card.get_node("Attack").text = str(card.attack)
			if card.attack < 0:
				card.attack = 0
	print("Your d*ick is now a noodle")
	pass
