using Godot;
using System;

public partial class Ally1 : AllyTemplate {
	public Ally1() {
		name = "Ally 1";
		cost = 1;
		attack = 2;
		defense = 1;
		hp = defense;
	}
	
	public override void effect(Game g, EffectType e) {
		// No effect
	}
}
