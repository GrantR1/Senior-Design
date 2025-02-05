using Godot;
using System;

public partial class Spell6 : SpellTemplate {
	public Spell6() {
		name = "Spell 6";
		cost = 3;
		type = EffectType.Play;
	}
	
	public override void effect(Game g, EffectType e) {
		if (e == type) {
			
		}
	}
}
