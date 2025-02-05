using Godot;
using System;

public partial class Guardian1 : GuardianTemplate {
	public Guardian1() {
		name = "Guardian 1";
		cost = 2;
		defense = 4;
		hp = defense;
	}
	
	public override void effect(Game g, EffectType e) {
		// No effect
	}
}
