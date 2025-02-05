using Godot;
using System;

public partial class Spell2 : SpellTemplate {
	public Spell2() {
		name = "Spell 2";
		cost = 2;
		type = EffectType.Play;
	}
	
	public override void effect(Game g, EffectType e) {
		if (e == type) {
			
		}
	}
}
