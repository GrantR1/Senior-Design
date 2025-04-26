extends Node

func trigger_ability(battle_manager_reference):
	
	var cards_to_destroy = []
	
	for card in battle_manager_reference.opponent_cards_on_battlefield:
		card.def = max(0, card.def - 1)
		card.get_node("Def").text = str(card.def)
		if card.def == 0:
			cards_to_destroy.append(card)
		
	if cards_to_destroy.size() > 0:
		for card in cards_to_destroy:
			battle_manager_reference.destroy_card(card,"Opponent")

	print("ability triggered")
