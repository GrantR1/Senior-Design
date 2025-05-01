extends Node
const CARDS = { #attack #defense #cost, card type, abiliy text, ability script
	"Teachers Assistant" : [2,1,1, "Spell", "We make mistakes too.", "res://Abilities/Drain_Atk_Field.gd"], 
	"The Professor" : [2,3,3, "Spell", "You can prove this trivially\n as an exercise after class.", "res://Abilities/Guardian_Play_One_More.gd"], 
	"Moody Student" : [2,2,2, "Spell", "We're all one on some day.", "res://Abilities/Heal_On_atk.gd"],
	"SS Stevens victory": [0, 5,3, "Guardian", "A floating dormitory? Can you\n imagine what it must've been \nlike to sleep in it?", "res://Abilities/Minus_1_on_def.gd"],
	"Henry Morton": [2,2,2, "Spell", "The first president of Stevens,\n followed by Alexander Humphreys.", "res://Abilities/Fireball.gd"],
	"University Center Complex": [0, 2, 1, "Guardian", " A building with an absurdly \nhigh floor-to-elevator ratio.", "res://Abilities/Plus_2_on_play.gd"],
	"Sleep Deprived": [1,2,2, "Spell", "Deals 1 damage to all cards.\n You've all been to college,\n you know what this is.", "res://Abilities/Deal_1_to_all.gd"]
}

const CARDS2 = { #Student Deck
	"Undergrad": [2, 1, 1, "Spell", "A simple student trying for\n their bachelor's degree.\n Wish them luck!", null],
	"The Professor": [1,3,3, "Spell", "A master of their craft\n dedicated to helping students!", null],
	"Study Buddy": [0, 5, 3, "Spell", "A buddy with the capacity\n for study!", null],
	"Atilla the Duck": [4, 1, 4, "Spell", "A fierce duck with a \n love for free bread and\n swimming in the Hudson.\n Doesn't play well with hawks.", null],
	"Stevens' S.C. Williams Library": [0, 3, 3, "Guardian", "Home to many famous works by\n Leonardo de Vinci, Alexander Calder,\n and Frederick Winslow Taylor.", null],
	"University Center Complex": [0, 2, 1, "Guardian", "Housing thousands of students\n since 2022!", null],
	"Grading Curve": [0, 0, 1, "Spell", " Fear the professor who uses it\n and beg the others to get it.", null],
	"Extra Credit": [0, 0, 2, "Spell", "A savior for those\n who have fallen behind.", null],
	"Failed Test": [0, 0, 3, "Spell", "Maybe next time, we study\n at least 2 days in advance!", null],
	"Honor Code Violation": [0, 0, 4, "Spell", "I pledge my honor that I\n have abided by the Stevens\n Honors System. There, now I can \nhand this in as my final project.", null],
	"Study Session": [0, 0, 2, "Spell", "Home to the infamous Study Buddy!", null]
}

const CARDS3 = { #Statistics Deck
	"Teachers Assistant": [2,1,1, "Spell", "I once corrected one.\n It made me feel smart!", null],
	"The Professor": [1,3,3, "Spell", "The leading cause in Gen-Z stress.", null],
	"Moody Student": [1,2,2, "Spell", "In ten years, you’ll think back,\n remember them, and wish you hadn’t.", null],
	"S.S Stevens": [0, 4, 4, "Guardian", "A victory ship named to honor\n yours truly. A staple of \nany Stevens based card game.", null],
	"Pop Quiz": [0, 2, 2, "Guardian", "The union of weasels and students\n who thought skipping was safe.", null],
	"Stevens Campus Police": [0, 1, 1, "Guardian", "The might of justice.\n The protectors of nerds.", null],
	"Extra Credit": [0, 0, 2, "Spell", "A poor man's curve.", null],
	"Failed Test": [0, 0, 3, "Spell", "Should've gone to office hours.", null],
	"Study Session": [0, 0, 2, "Spell", "Can you say that all again...\n like from the beginning?", null],
	"Tough Classes": [0, 0, 2, "Spell", "'Is there a curve?'\n Only a normal one in MA-331.", null],
	"MA-222 Probability and Statistics": [0, 0, 1, "Spell", "So how do I calculate the \nprobability of passing this class?", null],
	"MA-623 Stochastic Processes": [0, 0, 1, "Spell", "Markov chains are easy!\n Just don't get stuck in\n an absorbing state.", null]
}

const CARDS4 = { #Mixed Deck
	"Study Buddy": [0, 5, 4, "Spell", "The best kind of buddy.", null],
	"Atilla the Duck": [4, 1, 5, "Spell", "Who said a duck can’t be a hero.", null],
	"S.S Stevens": [0, 4, 4, "Guardian", "It’s like the college, but it’s a boat!", null],
	"SS Stevens victory": [0, 5,3, "Guardian", "The words Stevens and\n Victory belong together.", null],
	"Walker Gymnasium": [0, 1, 2, "Guardian", "Hit the gym and \nstrengthen your battlefield", null],
	"TI-Nspire Graphing Calculator": [0, 0, 2, "Spell", "This one is good for plotting.", null],
	"Failed Test": [0, 0, 3, "Spell", "Deliver terrible news to your opponent.", null],
	"A+ Test": [0, 1, 1, "Spell", "By the power of study!", null],
	"Sleep Deprived": [1,1,2, "Spell", "The students yearn for their bed", null],
	"Tough Classes": [0, 0, 2, "Spell", "Finally! Classes for tough students!", null],
	"Honor Code Violation": [0, 0, 4, "Spell", "Cheaters never prosper", null]
}

const CARDS5 = { #History Deck
	"Edwin A. Stevens": [2, 1, 1, "Spell", "A member of the Stevens family,\n 'America's First Family of Engineers'.\n Stevens Institute of Technology\n was founded using his bequeathment.\n If not for him,\n none of us would be here!", null],
	"William H. Perice": [1, 3, 3, "Spell", "A civil engineer and metallurgist.\n His prowess in the latter earned\n him the title 'Copper King'\n (see the crown?).", null],
	"Henry Morton": [6, 1, 5, "Spell", "The first president of\n Stevens Institute of Technology\n with a penchant for poetry.", null],
	"The Center for Maritime Systems at Stevens": [0, 5, 6, "Guardian", "Initially founded to study ships,\n but has since expanded to\n things such as storm forecasting.", null],
	"Stevens' S.C. Williams Library": [0, 2, 4, "Guardian", "Librarians are always willing to\n help on the first floor,\n but no talking on the third floor!", null],
	"Walker Gymnasium": [0, 3, 4, "Guardian", "Part of the National\n Register of Historic Places!", null], 
	"Charles V. Schaefer Jr. School of Engineering and Science": [0, 0, 2, "Spell", "One of four of Stevens' schools \n until the School of Systems\n and Enterprises became \n a department in SES instead.", null],
	"Office of Innovation and Entrepreneruship": [0, 0, 1, "Spell", "An office dedicated to two\n of Stevens' most important values.", null],
	"The Center for Innovation in Engineering and Science Education": [2, 0, 2, "Spell", "Stevens' dedication to education\n goes beyond its own classrooms!", null],
	"The Center for Environmental Systems": [0, 0, 1, "Spell", "Now more than ever, sustainability \nis an important concern.", null], 
	"The Highly Filled Materials Institute": [0, 0, 2, "Spell", "Is this at all applicable to jelly \ndonuts? ... Oh, I was WAY off.", null]
}
