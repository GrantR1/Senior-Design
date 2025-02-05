using Godot;
using System;

public partial class Monument1 : MonumentTemplate {
	public Monument1() {
		name = "Monument 1";
		cost = 4;
	}
	
	public override void effect(Game g, EffectType e) {
		// No effect
	}
}
