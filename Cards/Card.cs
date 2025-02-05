using Godot;
using System;

public enum EffectType {
	Play,
	Spell,
	Summon,
	TurnStart,
	TurnEnd,
	SelfAttack,
	AllyAttack,
	SelfDefense,
	AllyDefense,
	RandomEvent
}

abstract public class Card {
	
	protected String name;
	
	public abstract void effect(Game g, EffectType e);
	
	public String getName() {
		return name;
	}
}
