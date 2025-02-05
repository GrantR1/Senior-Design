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
	
	//The below methods were made to get screenshots of a working game
	public void randomizeGame() {
		Random rng = new Random();
		turn = 2 + rng.Next(6);
		pMana = turn - rng.Next(2);
		if (pMana < 0) {
			pMana = 0;
		}
		cMana = turn;
		List<Card> allies = new List<Card>();
		allies.Add(new Ally1());
		allies.Add(new Ally2());
		allies.Add(new Ally3());
		allies.Add(new Ally4());
		allies.Add(null);
		allies.Add(null);
		List<Card> guardians = new List<Card>();
		guardians.Add(new Guardian1());
		guardians.Add(new Guardian1());
		guardians.Add(null);
		guardians.Add(null);
		guardians.Add(null);
		
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j+=3) {
				shuffleDeck(allies);
				lanes[i][j] = allies[0];
			}
		}
		for (int i = 0; i < 4; i++) {
			for (int j = 1; j < 3; j++) {
				int k = 3*(j - 1);
				if (lanes[i][k] != null) {
					shuffleDeck(guardians);
					lanes[i][j] = guardians[0];
				}
			}
		}
		
		int undraw = turn + rng.Next(turn);
		for (int i = 0; i < undraw; i++) {
			playerDeck.drawCard();
		}
		undraw = turn + rng.Next(turn);
		for (int i = 0; i < undraw; i++) {
			computerDeck.drawCard();
		}
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
