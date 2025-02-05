using Godot;
using System;

public partial class Ally2 : AllyTemplate {
	public Ally2() {
		name = "Ally 2";
		cost = 3;
		attack = 1;
		defense = 3;
		hp = defense;
	}
	
	public override void effect(Game g, EffectType e) {
		// No effect
	}
}
