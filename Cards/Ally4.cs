using Godot;
using System;

public partial class Ally4 : AllyTemplate {
	public Ally4() {
		name = "Ally 4";
		cost = 5;
		attack = 6;
		defense = 1;
		hp = defense;
	}
	
	public override void effect(Game g, EffectType e) {
		// No effect
	}
}
