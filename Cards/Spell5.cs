using Godot;
using System;

public partial class Spell5 : SpellTemplate {
	public Spell5() {
		name = "Spell 5";
		cost = 4;
		type = EffectType.Play;
	}
	
	public override void effect(Game g, EffectType e) {
		if (e == type) {
			
		}
	}
}
