using Godot;
using System;

public partial class Spell4 : SpellTemplate {
	public Spell4() {
		name = "Spell 4";
		cost = 3;
		type = EffectType.Spell;
	}
	
	public override void effect(Game g, EffectType e) {
		if (e == type) {
			
		}
	}
}
