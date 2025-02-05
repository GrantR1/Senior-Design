using Godot;
using System;

public partial class Spell3 : SpellTemplate {
	public Spell3() {
		name = "Spell 3";
		cost = 2;
		type = EffectType.Play;
	}
	
	public override void effect(Game g, EffectType e) {
		if (e == type) {
			
		}
	}
}
