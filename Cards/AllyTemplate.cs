using Godot;
using System;

abstract public class AllyTemplate : Card {
	protected int cost;
	protected int attack;
	protected int defense;
	protected int hp;
	
	public int getAttack() {
		return attack;
	}
	
	public int getDefense() {
		return defense;
	}
	
	public int getHp() {
		return hp;
	}
	
	public bool dealDamage(int delta) {
		hp -= delta;
		if (hp > defense) {
			hp = defense;
			return false;
		}
		if (hp <= 0) {
			hp = 0;
			return true;
		} 
		return false;
	}
	
	public int getCost() {
		return cost;
	}
}
