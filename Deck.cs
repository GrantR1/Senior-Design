using Godot;
using System;
using System.Collections.Generic;
using static DeckTemplate;

public enum DeckTemplate {
	GenericDeck,
	RandomDeck,
	MixedDeck
}

public partial class Deck : GodotObject {
	
	private List<Card> drawPile = new List<Card>(), 
					   discardPile = new List<Card>();
	
	public Deck(DeckTemplate dt) {
		switch (dt) {
			case RandomDeck:
				break;
			case MixedDeck:
				break;
			case GenericDeck:
				makeGeneric();
				break;
		}
		shuffleDeck();
	}
	
	public Card drawCard() {
		int dpc = drawPile.Count - 1;
		Card c = drawPile[dpc];
		drawPile.RemoveAt(dpc);
		return c;
	}
	
	public void insertCardReshuffle(Card c) {
		drawPile.Add(c);
		shuffleDeck();
	}
	
	public void insertCardBottom(Card c) {
		drawPile.Insert(0, c);
	}
	
	public void shuffleDeck() {
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
	
	public int getSize() {
		return drawPile.Count;
	}
	
	public void makeGeneric() {
		drawPile.Add(new Ally1());
		drawPile.Add(new Ally1());
		drawPile.Add(new Ally1());
		drawPile.Add(new Ally2());
		drawPile.Add(new Ally2());
		drawPile.Add(new Ally3());
		drawPile.Add(new Ally3());
		drawPile.Add(new Ally4());
		drawPile.Add(new Guardian1());
		drawPile.Add(new Guardian1());
		drawPile.Add(new Guardian1());
		drawPile.Add(new Monument1());
		drawPile.Add(new Spell1());
		drawPile.Add(new Spell1());
		drawPile.Add(new Spell1());
		drawPile.Add(new Spell2());
		drawPile.Add(new Spell2());
		drawPile.Add(new Spell3());
		drawPile.Add(new Spell3());
		drawPile.Add(new Spell3());
		drawPile.Add(new Spell4());
		drawPile.Add(new Spell4());
		drawPile.Add(new Spell5());
		drawPile.Add(new Spell6());
	}
}
