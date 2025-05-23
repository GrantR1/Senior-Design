extends Node
const CARDS = { #attack #defense #cost, card type, abiliy text, ability script
	"Teachers Assistant" : [2,1,1, "Spell", "We make mistakes too.", "res://Abilities/Drain_Atk_Field.gd","Teachers Assistant"], 
	"The Professor" : [2,3,3, "Spell", "You can prove this trivially as an exercise after class.", "res://Abilities/Guardian_Play_One_More.gd","The Professor"], 
	"Moody Student" : [2,2,2, "Spell", "We're all one on some day.", "res://Abilities/Heal_On_atk.gd","Moody Student"],
	"SS Stevens victory": [0, 5,3, "Guardian", "A floating dormitory? Can you imagine what it must've been like to sleep in it?", "res://Abilities/Minus_1_on_def.gd","SS Stevens victory"],
	"Henry Morton": [2,2,2, "Spell", "The first president of Stevens, followed by Alexander Humphreys.", "res://Abilities/Fireball.gd","Henry Morton"],
	"University Center Complex": [0, 2, 1, "Guardian", " A building with an absurdly high floor-to-elevator ratio.", "res://Abilities/Plus_2_on_play.gd","University Center Complex"],
	"Sleep Deprived": [1,2,2, "Spell", "Deals 1 damage to all cards. You've all been to college, you know what this is.", "res://Abilities/Deal_1_to_all.gd","Sleep Deprived"]
}

const CARDS2 = { #Student Deck
	"Undergrad": [2, 1, 1, "Spell", "Ability \n Increase all your attack by 1 \n Description \n A simple student trying for their bachelor's degree. Wish them luck!", "res://Abilities/Plus_1_atk_for_everyone.gd","Undergrad"],
	"The Professor": [1,3,3, "Spell", "Ability \n Increase all your attack by 1 \n Description \n A master of their craft dedicated to helping students!", "res://Abilities/Plus_1_atk_for_everyone.gd","The Professor"],
	"Study Buddy": [2, 5, 3, "Spell", "Ability \n Draw 2 Cards \n Description \n A buddy with the capacity for study!", "res://Abilities/Plus_2_on_play.gd","Study Buddy"],
	"Atilla the Duck": [4, 1, 4, "Spell", "Ability \n Take 1 Damage on itself or Double your attack when attacking \n Description \n A fierce duck with a love for free bread and swimming in the Hudson. Doesn't play well with hawks.", "res://Abilities/Dmg_Gamble.gd","Atilla the Duck"],
	"Stevens' S.C. Williams Library": [0, 3, 3, "Guardian", "Ability \n Draw 2 Cards \n Description \n Home to many famous works by Leonardo de Vinci, Alexander Calder, and Frederick Winslow Taylor.", "res://Abilities/Plus_2_on_play.gd","Stevens' S.C. Williams Library"],
	"University Center Complex": [0, 3, 1, "Guardian", "Ability \n Block 1 damage per each attack \n Description \n Housing thousands of students since 2022!", "res://Abilities/Minus_1_on_def.gd","University Center Complex"],
	"Grading Curve": [2, 2, 1, "Spell", "Ability \n +1 Health \n Description \n Fear the professor who uses it and beg the others to get it.", "res://Abilities/More_HP_Pls.gd","Grading Curve"],
	"Extra Credit": [1, 1, 2, "Spell", "Ability \n Increase all your attack by 1 \n Description \n A savior for those who have fallen behind.", "res://Abilities/Plus_1_atk_for_everyone.gd","Extra Credit"],
	"Failed Test": [4, 1, 3, "Spell", "Ability \n Deal one damage to opponent on play \n Description \n Maybe next time, we study at least 2 days in advance!", "res://Abilities/Fireball.gd","Failed Test"],
	"Honor Code Violation": [4, 2, 4, "Spell", "Ability \n Deal one damage to everything \n Description \n I pledge my honor that I have abided by the Stevens Honors System. There, now I can hand this in as my final project.", "res://Abilities/Deal_1_to_all.gd","Honor Code Violation"],
	"Study Session": [1, 1, 2, "Spell", "Ability \n Increase all your attack by 1 \n Description \n Home to the infamous Study Buddy!", "res://Abilities/Plus_1_atk_for_everyone.gd","Study Session"]
}

const CARDS3 = { #Statistics Deck
	"Teachers Assistant": [2,1,1, "Spell", "Ability \n Take 1 Damage on itself or Double your attack when attacking \n Description \n I once corrected one. It made me feel smart!", "res://Abilities/Dmg_Gamble.gd","Teachers Assistant"],
	"The Professor": [1,3,3, "Spell", "Ability \n -1 Attack to all opponents cards \n Description \n The leading cause in Gen-Z stress.", "res://Abilities/Drain_Atk_Field.gd","The Professor"],
	"Moody Student": [1,2,2, "Spell", "Ability \n Take 1 Damage on itself or Double your attack when attacking \n Description \n In ten years, you’ll think back, remember them, and wish you hadn’t.", "res://Abilities/Dmg_Gamble.gd","Moody Student"],
	"S.S Stevens": [0, 4, 4, "Guardian", "Ability \n Block 1 damage per each attack \n Description \n A victory ship named to honor yours truly. A staple of any Stevens based card game.", "res://Abilities/Minus_1_on_def.gd","S.S Stevens"],
	"Pop Quiz": [0, 2, 2, "Guardian", "Ability \n Deal one damage to everything \n Description \n The union of weasels and students who thought skipping was safe.", "res://Abilities/Deal_1_to_all.gd","Pop Quiz"],
	"Stevens Campus Police": [0, 1, 1, "Guardian", "Ability \n Block 1 damage per each attack \n Description \n The might of justice. The protectors of nerds.", "res://Abilities/Minus_1_on_def.gd","Stevens Campus Police"],
	"Extra Credit": [1, 1, 2, "Spell", "Ability \n Increase all your attack by 1 \n Description \n A poor man's curve.", "res://Abilities/Plus_1_atk_for_everyone.gd","Extra Credit"],
	"Failed Test": [2, 3, 3, "Spell", "Ability \n Deal one damage to opponent on play \n Description \n Should've gone to office hours.", "res://Abilities/Fireball.gd","Failed Test"],
	"Study Session": [2, 2, 2, "Spell", "Ability \n Increase all your attack by 1 \n Description \n Can you say that all again... like from the beginning?", "res://Abilities/Plus_1_atk_for_everyone.gd","Study Session"],
	"Tough Classes": [3, 2, 2, "Spell", "Ability \n Deal one damage to everything \n Description \n 'Is there a curve?' Only a normal one in MA-331.", "res://Abilities/Deal_1_to_all.gd","Tough Classes"],
	"MA-222 Probability and Statistics": [2, 1, 1, "Spell", "Ability \n 1/3 chance of dodging an attack \n Description \n So how do I calculate the probability of passing this class?", "res://Abilities/Jacobs_Gambling_Addiction.gd","MA-222 Probability and Statistics"],
	"MA-623 Stochastic Processes": [2, 4, 1, "Spell", "Ability \n Deal one damage to opponent on play \n Description \n Markov chains are easy! Just don't get stuck in an absorbing state.", "res://Abilities/Fireball.gd","MA-623 Stochastic Processes"]
}

const CARDS4 = { #Mixed Deck
	"Study Buddy": [2, 5, 4, "Spell", "Ability \n Increase all your attack by 1 \n Description \n The best kind of buddy.", "res://Abilities/Plus_1_atk_for_everyone.gd","Study Buddy"],
	"Atilla the Duck": [4, 1, 5, "Spell", "Ability \n Take 1 Damage on itself or Double your attack when attacking \n Description \n Who said a duck can’t be a hero.", "res://Abilities/Dmg_Gamble.gd","Atilla the Duck"],
	"S.S Stevens": [0, 4, 4, "Guardian", "Ability \n Block 1 damage per each attack \n Description \n It’s like the college, but it’s a boat!", "res://Abilities/Minus_1_on_def.gd","S.S Stevens"],
	"SS Stevens victory": [1, 5,3, "Guardian", "Ability \n Deal one damage to everything \n Description \n The words Stevens and Victory belong together.", "res://Abilities/Deal_1_to_all.gd","SS Stevens victory"],
	"Walker Gymnasium": [0, 3, 2, "Guardian", "Ability \n Increase all your attack by 1 \n Description \n Hit the gym and strengthen your battlefield", "res://Abilities/Plus_1_atk_for_everyone.gd","Walker Gymnasium"],
	"TI-Nspire Graphing Calculator": [1, 2, 2, "Spell", "Ability \n -1 Attack to all opponents cards \n Description \n This one is good for plotting.", "res://Abilities/Drain_Atk_Field.gd","TI-Nspire Graphing \nCalculator"],
	"Failed Test": [3, 1, 3, "Spell", "Description \n Deliver terrible news to your opponent.", null,"Failed Test"],
	"A+ Test": [2, 2, 1, "Spell", "Ability \n Increase all your attack by 1 \n Description \n By the power of study!", "res://Abilities/Plus_1_atk_for_everyone.gd","A+ Test"],
	"Sleep Deprived": [1,2,2, "Spell", "Ability \n Deal one damage to opponent on play \n Description \n The students yearn for their bed", "res://Abilities/Fireball.gd","Sleep Deprived"],
	"Tough Classes": [2, 2, 2, "Spell", "Ability \n -1 Attack to all opponents cards \n Description \n Finally! Classes for tough students!", "res://Abilities/Drain_Atk_Field.gd","Tough Classes"],
	"Honor Code Violation": [5, 2, 4, "Spell", "Ability \n Deal one damage to everything \n Description \n Cheaters never prosper", "res://Abilities/Deal_1_to_all.gd","Honor Code Violation"]
}

const CARDS5 = { #History Deck
	"Edwin A. Stevens": [2, 1, 1, "Spell", "Description \n A member of the Stevens family, 'America's First Family of Engineers'. Stevens Institute of Technology was founded using his bequeathment. If not for him, none of us would be here!", null,"Edwin A. Stevens"],
	"William H. Perice": [1, 3, 3, "Spell", "Ability \n Can play a second card this turn \n Description \n A civil engineer and metallurgist. His prowess in the latter earned him the title 'Copper King' (see the crown?).", "res://Abilities/Guardian_Play_One_More.gd","William H. Perice"],
	"Henry Morton": [6, 1, 5, "Spell", "Ability \n Take 1 Damage on itself or Double your attack when attacking \n Description \n The first president of Stevens Institute of Technology with a penchant for poetry.", "res://Abilities/Dmg_Gamble.gd","Henry Morton"],
	"The Center for Maritime Systems at Stevens": [0, 5, 6, "Guardian", "Description \n Initially founded to study ships, but has since expanded to things such as storm forecasting.", null,"The Center for Maritime Systems at Stevens"],
	"Stevens' S.C. Williams Library": [0, 3, 4, "Guardian", "Ability \n Draw 2 Cards \n Description \n Librarians are always willing to help on the first floor, but no talking on the third floor!", "res://Abilities/Plus_2_on_play.gd","Stevens' S.C. Williams Library"],
	"Walker Gymnasium": [0, 4, 4, "Guardian", "Ability \n Block 1 damage per each attack \n Description \n Part of the National\n Register of Historic Places!", "res://Abilities/Minus_1_on_def.gd","Walker Gymnasium"], 
	"Charles V. Schaefer Jr. School of Engineering and Science": [4, 2, 2, "Spell", "Description \n One of four of Stevens' schools until the School of Systems and Enterprises became a department in SES instead.", null,"Charles V. Schaefer Jr. School of Engineering and Science"],
	"Office of Innovation and Entrepreneruship": [2, 2, 1, "Spell", "Description \n An office dedicated to two of Stevens' most important values.", null,"Office of Innovation and Entrepreneruship"],
	"The Center for Innovation in Engineering and Science Education": [2, 0, 2, "Spell", "Ability \n Increase all your attack by 1 \n Description \n Stevens' dedication to education goes beyond its own classrooms!", "res://Abilities/Plus_1_atk_for_everyone.gd","The Center for Innovation in Engineering and Science Education"],
	"The Center for Environmental Systems": [2, 3, 1, "Spell", "Ability \n Increase all your attack by 1 \n Description \n Now more than ever, sustainability is an important concern.", "res://Abilities/Plus_1_atk_for_everyone.gd","The Center for Environmental Systems"], 
	"The Highly Filled Materials Institute": [1, 2, 2, "Spell", "Ability \n Deal one damage to opponent on play \n Description \n Is this at all applicable to jelly donuts? ... Oh, I was WAY off.", "res://Abilities/Fireball.gd","The Highly Filled Materials Institute"]
}
