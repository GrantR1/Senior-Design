using Godot;
using System;

public partial class Spell1 : SpellTemplate {
	public Spell1() {
		name = "Spell 1";
		cost = 1;
		type = EffectType.Play;
	}
	
	public override void effect(Game g, EffectType e) {
		if (e == type) {
			
		}
	}
}
