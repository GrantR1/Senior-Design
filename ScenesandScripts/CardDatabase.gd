extends Node
const CARDS = { #attack #defense #cost, card type, abiliy text, ability script
	"Teachers Assistant" : [2,1,1, "Spell", "1", null], 
	"The Professor" : [2,3,3, "Spell", "2", null], 
	"Moody Student" : [2,2,2, "Spell", "3", null],
	"SS Stevens victory": [0, 5,3, "Guardian", "4", "res://Abilities/SS_Stevens.gd"],
	"Henry Morton": [2,2,2, "Spell", "5", null],
	"University Center Complex": [0, 2, 1, "Guardian", "6", "res://Abilities/SC_Library.gd"],
	"Sleep Deprived": [10,1,2, "Spell", "7", "res://Abilities/Sleep_Deprived.gd"]
}

const CARDS2 = { #Student Deck
	"Undergrad": [2, 1, 1, "Spell", "1", null],
	"The Professor": [1,3,3, "Spell", "2", null],
	"Study Buddy": [0, 5, 3, "Spell", "3", null],
	"Atilla the Duck": [4, 1, 4, "Spell", "4", null],
	"Stevens' S.C. Williams Library": [0, 3, 3, "Guardian", "5", null],
	"University Center Complex": [0, 2, 1, "Guardian", "6", null],
	"Grading Curve": [0, 0, 1, "Spell", "7", null],
	"Extra Credit": [0, 0, 2, "Spell", "8", null],
	"Failed Test": [0, 0, 3, "Spell", "9", null],
	"Honor Code Violation": [0, 0, 4, "Spell", "10", null],
	"Study Session": [0, 0, 2, "Spell", "11", null]
}

const CARDS3 = { #Statistics Deck
	"Teachers Assistant": [2,1,1, "Spell", "1", null],
	"The Professor": [1,3,3, "Spell", "2", null],
	"Moody Student": [1,2,2, "Spell", "3", null],
	"S.S Stevens": [0, 4, 4, "Guardian", "4", null],
	"Pop Quiz": [0, 2, 2, "Guardian", "5", null],
	"Stevens Campus Police": [0, 1, 1, "Guardian", "6", null],
	"Extra Credit": [0, 0, 2, "Spell", "7", null],
	"Failed Test": [0, 0, 3, "Spell", "8", null],
	"Study Session": [0, 0, 2, "Spell", "9", null],
	"Tough Classes": [0, 0, 2, "Spell", "10", null],
	"MA-222 Probability and Statistics": [0, 0, 1, "Spell", "11", null],
	"MA-623 Stochastic Processes": [0, 0, 1, "Spell", "12", null]
}

const CARDS4 = { #Mixed Deck
	"Study Buddy": [0, 5, 4, "Spell", "1", null],
	"Atilla the Duck": [4, 1, 5, "Spell", "2", null],
	"S.S Stevens": [0, 4, 4, "Guardian", "3", null],
	"SS Stevens victory": [0, 5,3, "Guardian", "4", null],
	"Walker Gymnasium": [0, 1, 2, "Guardian", "5", null],
	"TI-Nspire Graphing Calculator": [0, 0, 2, "Spell", "6", null],
	"Failed Test": [0, 0, 3, "Spell", "7", null],
	"A+ Test": [0, 1, 1, "Spell", "8", null],
	"Sleep Deprived": [1,1,2, "Spell", "9", "res://Abilities/Sleep_Deprived.gd"],
	"Tough Classes": [0, 0, 2, "Spell", "10", null],
	"Honor Code Violation": [0, 0, 4, "Spell", "11", null]
}

const CARDS5 = { #History Deck
	"Edwin A. Stevens": [2, 1, 1, "Spell", "", null],
	"William H. Perice": [1, 3, 3, "Spell", "", null],
	"Henry Morton": [6, 1, 5, "Spell", "", null],
	"The Center for Maritime Systems at Stevens": [0, 5, 6, "Guardian", "", null],
	"Stevens' S.C. Williams Library": [0, 2, 4, "Guardian", "", null],
	"Walker Gymnasium": [0, 3, 4, "Guardian", "", null], 
	"Charles V. Schaefer Jr. School of Engineering and Science": [0, 0, 2, "Spell", "", null],
	"Office of Innovation and Entrepreneruship": [0, 0, 1, "Spell", "", null],
	"The Center for Innovation in Engineering and Science Education": [2, 0, 2, "Spell", "", null],
	"The Center for Environmental Systems": [0, 0, 1, "Spell", "", null], 
	"The Highly Filled Materials Institute": [0, 0, 2, "Spell", "", null]
}
