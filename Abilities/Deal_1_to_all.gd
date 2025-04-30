extends Node

func trigger_ability(battle_manager_reference, user):
	
	var cards_to_destroy_player = []
	var cards_to_destroy_opponent = []
	
	for card in battle_manager_reference.player_cards_on_battlefield:
		card.def = max(0, card.def - 1)
		card.get_node("Def").text = str(card.def)
		if card.def == 0:
			cards_to_destroy_player.append(card)
	for card in battle_manager_reference.opponent_cards_on_battlefield:
		card.def = max(0, card.def - 1)
		card.get_node("Def").text = str(card.def)
		if card.def == 0:
			cards_to_destroy_opponent.append(card)
		
	if cards_to_destroy_opponent.size() > 0:
		for card in cards_to_destroy_opponent:
			battle_manager_reference.destroy_card(card,"Opponent")
	if cards_to_destroy_player.size() > 0:
		for card in cards_to_destroy_player:
			battle_manager_reference.destroy_card(card,"Player")
	print("ability triggered")
	pass
