using Godot;
using System;

public partial class Ally3 : AllyTemplate {
	public Ally3() {
		name = "Ally 3";
		cost = 4;
		attack = 0;
		defense = 5;
		hp = defense;
	}
	
	public override void effect(Game g, EffectType e) {
		// No effect
	}
}
