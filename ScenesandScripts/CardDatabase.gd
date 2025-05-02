extends Node
const CARDS = { #attack #defense #cost, card type, abiliy text, ability script
	"Teachers Assistant" : [2,1,1, "Spell", "We make mistakes too.", "res://Abilities/Drain_Atk_Field.gd","Teachers Assistant"], 
	"The Professor" : [2,3,3, "Spell", "You can prove this trivially\n as an exercise after class.", "res://Abilities/Guardian_Play_One_More.gd","The Professor"], 
	"Moody Student" : [2,2,2, "Spell", "We're all one on some day.", "res://Abilities/Heal_On_atk.gd","Moody Student"],
	"SS Stevens victory": [0, 5,3, "Guardian", "A floating dormitory? Can you\n imagine what it must've been \nlike to sleep in it?", "res://Abilities/Minus_1_on_def.gd","SS Stevens victory"],
	"Henry Morton": [2,2,2, "Spell", "The first president of Stevens,\n followed by Alexander Humphreys.", "res://Abilities/Fireball.gd","Henry Morton"],
	"University Center Complex": [0, 2, 1, "Guardian", " A building with an absurdly \nhigh floor-to-elevator ratio.", "res://Abilities/Plus_2_on_play.gd","University Center Complex"],
	"Sleep Deprived": [1,2,2, "Spell", "Deals 1 damage to all cards.\n You've all been to college,\n you know what this is.", "res://Abilities/Deal_1_to_all.gd","Sleep Deprived"]
}

const CARDS2 = { #Student Deck
	"Undergrad": [2, 1, 1, "Spell", "A simple student trying for\n their bachelor's degree.\n Wish them luck!", "res://Abilities/Plus_1_atk_for_everyone.gd","Undergrad"],
	"The Professor": [1,3,3, "Spell", "A master of their craft\n dedicated to helping students!", "res://Abilities/Plus_1_atk_for_everyone.gd","The Professor"],
	"Study Buddy": [2, 5, 3, "Spell", "A buddy with the capacity\n for study!", "res://Abilities/Plus_2_on_play.gd","Study Buddy"],
	"Atilla the Duck": [4, 2, 4, "Spell", "A fierce duck with a \n love for free bread and\n swimming in the Hudson.\n Doesn't play well with hawks.", "res://Abilities/Dmg_Gamble.gd","Atilla the Duck"],
	"Stevens' S.C. Williams Library": [0, 3, 3, "Guardian", "Home to many famous works by\n Leonardo de Vinci, Alexander Calder,\n and Frederick Winslow Taylor.", "res://Abilities/Plus_2_on_play.gd","Stevens' S.C. Williams\n Library"],
	"University Center Complex": [0, 3, 1, "Guardian", "Housing thousands of students\n since 2022!", null,"University Center Complex"],
	"Grading Curve": [2, 2, 1, "Spell", " Fear the professor who uses it\n and beg the others to get it.", "res://Abilities/More_HP_Pls.gd","Grading Curve"],
	"Extra Credit": [1, 1, 2, "Spell", "A savior for those\n who have fallen behind.", "res://Abilities/Plus_1_atk_for_everyone.gd","Extra Credit"],
	"Failed Test": [4, 1, 3, "Spell", "Maybe next time, we study\n at least 2 days in advance!", "res://Abilities/Fireball.gd","Failed Test"],
	"Honor Code Violation": [4, 1, 4, "Spell", "I pledge my honor that I\n have abided by the Stevens\n Honors System. There, now I can \nhand this in as my final project.", "res://Abilities/Deal_1_to_all.gd","Honor Code Violation"],
	"Study Session": [1, 1, 2, "Spell", "Home to the infamous Study Buddy!", null,"Study Session"]
}

const CARDS3 = { #Statistics Deck
	"Teachers Assistant": [2,1,1, "Spell", "I once corrected one.\n It made me feel smart!", "res://Abilities/Dmg_Gamble.gd","Teachers Assistant"],
	"The Professor": [1,3,3, "Spell", "The leading cause in Gen-Z stress.", "res://Abilities/Drain_Atk_Field.gd","The Professor"],
	"Moody Student": [1,2,2, "Spell", "In ten years, you’ll think back,\n remember them, and wish you hadn’t.", "res://Abilities/Dmg_Gamble.gd","Moody Student"],
	"S.S Stevens": [0, 4, 4, "Guardian", "A victory ship named to honor\n yours truly. A staple of \nany Stevens based card game.", "res://Abilities/Minus_1_on_def.gd","S.S Stevens"],
	"Pop Quiz": [0, 2, 2, "Guardian", "The union of weasels and students\n who thought skipping was safe.", "res://Abilities/Deal_1_to_all.gd","Pop Quiz"],
	"Stevens Campus Police": [0, 1, 1, "Guardian", "The might of justice.\n The protectors of nerds.", "res://Abilities/Minus_1_on_def.gd","Stevens Campus Police"],
	"Extra Credit": [1, 1, 2, "Spell", "A poor man's curve.", "res://Abilities/Plus_1_atk_for_everyone.gd","Extra Credit"],
	"Failed Test": [2, 3, 3, "Spell", "Should've gone to office hours.", "res://Abilities/Fireball.gd","Failed Test"],
	"Study Session": [2, 2, 2, "Spell", "Can you say that all again...\n like from the beginning?", "res://Abilities/Plus_1_atk_for_everyone.gd","Study Session"],
	"Tough Classes": [3, 2, 2, "Spell", "'Is there a curve?'\n Only a normal one in MA-331.", "res://Abilities/Drain_Atk_Field.gd","Tough Classes"],
	"MA-222 Probability and Statistics": [2, 1, 1, "Spell", "So how do I calculate the \nprobability of passing this class?", "res://Abilities/Jacobs_Gambling_Addiction.gd","MA-222 Probability \nand Statistics"],
	"MA-623 Stochastic Processes": [2, 4, 1, "Spell", "Markov chains are easy!\n Just don't get stuck in\n an absorbing state.", null,"MA-623 Stochastic \nProcesses"]
}

const CARDS4 = { #Mixed Deck
	"Study Buddy": [2, 5, 4, "Spell", "The best kind of buddy.", "res://Abilities/Plus_1_atk_for_everyone.gd","Study Buddy"],
	"Atilla the Duck": [4, 1, 5, "Spell", "Who said a duck can’t be a hero.", "res://Abilities/Guardian_Play_One_More.gd","Atilla the Duck"],
	"S.S Stevens": [0, 4, 4, "Guardian", "It’s like the college, but it’s a boat!", "res://Abilities/Minus_1_on_def.gd","S.S Stevens"],
	"SS Stevens victory": [1, 5,3, "Guardian", "The words Stevens and\n Victory belong together.", "res://Abilities/Deal_1_to_all.gd","SS Stevens victory"],
	"Walker Gymnasium": [0, 3, 2, "Guardian", "Hit the gym and \nstrengthen your battlefield", null,"Walker Gymnasium"],
	"TI-Nspire Graphing Calculator": [1, 2, 2, "Spell", "This one is good for plotting.", "res://Abilities/Fireball.gd","TI-Nspire Graphing \nCalculator"],
	"Failed Test": [3, 1, 3, "Spell", "Deliver terrible news to your opponent.", "res://Abilities/Fireball.gd","Failed Test"],
	"A+ Test": [2, 2, 1, "Spell", "By the power of study!", "res://Abilities/Plus_1_atk_for_everyone.gd","A+ Test"],
	"Sleep Deprived": [1,2,2, "Spell", "The students yearn for their bed", null,"Sleep Deprived"],
	"Tough Classes": [2, 2, 2, "Spell", "Finally! Classes for tough students!", "res://Abilities/Drain_Atk_Field.gd","Tough Classes"],
	"Honor Code Violation": [5, 1, 4, "Spell", "Cheaters never prosper", "res://Abilities/Deal_1_to_all.gd","Honor Code Violation"]
}

const CARDS5 = { #History Deck
	"Edwin A. Stevens": [2, 1, 1, "Spell", "A member of the Stevens family,\n 'America's First Family of Engineers'.\n Stevens Institute of Technology\n was founded using his bequeathment.\n If not for him,\n none of us would be here!", null,"Edwin A. Stevens"],
	"William H. Perice": [1, 3, 3, "Spell", "A civil engineer and metallurgist.\n His prowess in the latter earned\n him the title 'Copper King'\n (see the crown?).", null,"William H. Perice"],
	"Henry Morton": [6, 1, 5, "Spell", "The first president of\n Stevens Institute of Technology\n with a penchant for poetry.", null,"Henry Morton"],
	"The Center for Maritime Systems at Stevens": [0, 5, 6, "Guardian", "Initially founded to study ships,\n but has since expanded to\n things such as storm forecasting.", null,"The Center for Maritime \nSystems at Stevens"],
	"Stevens' S.C. Williams Library": [0, 3, 4, "Guardian", "Librarians are always willing to\n help on the first floor,\n but no talking on the third floor!", "res://Abilities/Deal_1_to_all.gd","Stevens' S.C. Williams \nLibrary"],
	"Walker Gymnasium": [0, 4, 4, "Guardian", "Part of the National\n Register of Historic Places!", null,"Walker Gymnasium"], 
	"Charles V. Schaefer Jr. School of Engineering and Science": [4, 2, 2, "Spell", "One of four of Stevens' schools \n until the School of Systems\n and Enterprises became \n a department in SES instead.", null,"Charles V. Schaefer Jr. \nSchool of Engineering and Science"],
	"Office of Innovation and Entrepreneruship": [2, 2, 1, "Spell", "An office dedicated to two\n of Stevens' most important values.", "res://Abilities/Guardian_Play_One_More.gd","Office of Innovation \nand Entrepreneruship"],
	"The Center for Innovation in Engineering and Science Education": [2, 3, 2, "Spell", "Stevens' dedication to education\n goes beyond its own classrooms!", "res://Abilities/Plus_2_on_play.gd","The Center for Innovation in \nEngineering and Science Education"],
	"The Center for Environmental Systems": [2, 3, 1, "Spell", "Now more than ever, sustainability \nis an important concern.", "res://Abilities/Plus_1_atk_for_everyone.gd","The Center for \nEnvironmental Systems"], 
	"The Highly Filled Materials Institute": [1, 2, 2, "Spell", "Is this at all applicable to jelly \ndonuts? ... Oh, I was WAY off.", "res://Abilities/Fireball.gd","The Highly Filled \nMaterials Institute"]
}
