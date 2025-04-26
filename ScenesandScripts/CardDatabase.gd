extends Node
const CARDS = { #attack #defense #cost, card type, abiliy text, ability script
	"Teachers Assistant" : [2,1,1, "Spell", null, null], 
	"The Professor" : [2,3,3, "Spell", null, null], 
	"Moody Student" : [2,2,2, "Spell", null, null],
	"SS Stevens victory": [0, 5,3, "Guardian", null, "res://Abilities/SS_Stevens.gd"],
	"Henry Morton": [2,2,2, "Spell", null, null],
	"University Center Complex": [0, 2, 1, "Guardian", null, null],
	"Sleep Deprived": [1,1,2, "Spell", null, "res://Abilities/Sleep_Deprived.gd"]
}

const CARDS2 = { #Student Deck
	"Undergrad": [2, 1, 1, "Spell", null, null],
	"The Professor": [1,3,3, "Spell", null, null],
	"Study Buddy": [0, 5, 3, "Spell", null, null],
	"Atilla the Duck": [4, 1, 4, "Spell", null, null],
	"Stevens' S.C. Williams Library": [0, 3, 3, "Guardian", null, null],
	"University Center Complex": [0, 2, 1, "Guardian", null, null],
	"Grading Curve": [0, 0, 1, "Spell", null, null],
	"Extra Credit": [0, 0, 2, "Spell", null, null],
	"Prepared to Learn": [0, 2, 2, "Spell", null, null],
	"Failed Test": [0, 0, 3, "Spell", null, null],
	"Honor Code Validation": [0, 0, 4, "Spell", null, null],
	"Study Session": [0, 0, 2, "Spell", null, null]
}

const CARDS3 = { #Statistics Deck
	"Teachers Assistant": [2,1,1, "Spell", null, null],
	"The Professor": [1,3,3, "Spell", null, null],
	"Moody Student": [1,2,2, "Spell", null, null],
	"S.S Stevens": [0, 5, 4, "Guardian", null, null],
	"Pop Quiz": [0, 2, 2, "Guardian", null, null],
	"Stevens Campus Police": [0, 1, 1, "Guardian", null, null],
	"Extra Credit": [0, 0, 2, "Spell", null, null],
	"Failed Test": [0, 0, 3, "Spell", null, null],
	"Study Session": [0, 0, 2, "Spell", null, null],
	"Tough Classes": [0, 0, 2, "Spell", null, null],
	"MA-222 Probability and Statistics": [0, 0, 1, "Spell", null, null],
	"MA-623 Stochastic Processes": [0, 0, 1, "Spell", null, null]
}

const CARDS4 = { #Mixed Deck
	"Study Buddy": [0, 5, 4, "Spell", null, null],
	"Atilla the Duck": [4, 1, 5, "Spell", null, null],
	"S.S. Stevens": [0, 5, 4, "Guardian", null, null],
	"SS Stevens Victory": [0, 5,3, "Guardian", null, null],
	"Walker Gymnasium": [0, 1, 2, "Guardian", null, null],
	"TI-Nspire Graphing Calculator": [0, 0, 2, "Spell", null, null],
	"Failed Test": [0, 0, 3, "Spell", null, null],
	"A+ Test": [0, 1, 1, "Spell", null, null],
	"Sleep Deprived": [0, 0, 2, "Spell", null, null],
	"Tough Classes": [0, 0, 2, "Spell", null, null],
	"Honor Code Violation": [0, 0, 4, "Spell", null, null]
}

const CARDS5 = { #History Deck
	"Edwin A. Stevens": [2, 1, 1, "Spell", null, null],
	"William H. Perice": [1, 3, 3, "Spell", null, null],
	"Henry Morton": [6, 1, 5, "Spell", null, null],
	"The Center for Maritime Systems at Stevens": [0, 5, 6, "Guardian", null, null],
	"Stevens' S.C. Williams Library": [0, 2, 4, "Guardian", null, null],
	"Walker Gymnasium": [0, 3, 4, "Gurdian", null, null], 
	"Charles V. Schaefer Jr. School of Engineering and Science": [0, 0, 2, "Spell", null, null],
	"National Center for Secure and Resilient": [0, 0, 3, "Spell", null, null],
	"Office of Innovation and Entrepreneruship": [0, 0, 1, "Spell", null, null],
	"The Center for Innovation in Engineering and Science Education": [2, 0, 2, "Spell", null, null],
	"The Center for Environmental Systems": [0, 0, 1, "Spell", null, null], 
	"The Highly Filled Materials Institute": [0, 0, 2, "Spell", null, null]
}
