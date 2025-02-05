using Godot;
using System;
using System.Collections.Generic;

public partial class Game : GodotObject {
	private Deck playerDeck, computerDeck;
	private Display display;
	private List<Card> playerHand = new List<Card>();
	private List<Card> computerHand = new List<Card>();
	private Card[][] lanes = new Card[4][];
	private int turn = 1, playerTurn = 0;
	private int pMana = 1, cMana = 1;
	
	public Game(Deck pDeck, Deck cDeck, Display d) {
		playerDeck = pDeck;
		computerDeck = cDeck;
		display = d;
		
		for (int i = 0; i < 4; i++) {
			lanes[i] = new Card[4];
			for (int j = 0; j < 4; j++) {
				lanes[i][j] = null;
			}
		}
		
		initiateGame();
	}
	
	public void callShowGame() {
		display.showGame(lanes, 
			playerDeck.getSize(), 
			computerDeck.getSize(),
			playerHand,
			computerHand,
			turn,
			pMana,
			cMana);
	}
	
	public void initiateGame() {
		for (int i = 0; i < 5; i++) {
			playerHand.Add(playerDeck.drawCard());
			computerHand.Add(computerDeck.drawCard());
		}
		
		randomizeGame();
		GD.Print("randomized");
		callShowGame();
	}
	
	public void shuffleDeck(List<Card> drawPile) {
		Random rng = new Random();
		int n = drawPile.Count;
		while (n > 1) {
			n--;
			int k = rng.Next(n + 1);
			Card c = drawPile[k];
			drawPile[k] = drawPile[n];
			drawPile[n] = c;
		}
	}
}
