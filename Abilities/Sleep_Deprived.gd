extends Node

func trigger_ability(battle_manager_reference):
	for card in battle_manager_reference.opponent_cards_on_battlefield:
		card.def = max(0, card.def - 1)
		card.get_node("Def").text = str(card.def)
	print("ability triggered")
