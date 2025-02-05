using Godot;
using System;

abstract public class SpellTemplate : Card {
	protected int cost;
	protected EffectType type;
	
	public int getCost() {
		return cost;
	}
	
	public EffectType getType() {
		return type;
	}
}
