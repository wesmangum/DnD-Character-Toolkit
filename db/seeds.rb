# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Race.create([
    {
      name: 'Dwarf',
      description: "Dwarves are known for their skill in warfare, their ability to with- stand physical and magical punishment, their knowledge of the earth’s secrets, their hard work, and their capacity for drinking ale. Their mysterious kingdoms, carved out from the insides of moun- tains, are renowned for the marvelous treasures that they produce as gifts or for trade.",
      image: "races/dwarf.jpg"
    }, {
      name: 'Elf',
      description: "Elves mingle freely in human lands, always welcome yet never at home there. They are well known for their poetry, dance, song, lore, and magical arts. Elves favor things of natural and simple beauty. When danger threatens their woodland homes, however, elves reveal a more martial side, demonstrating skill with sword, bow, and battle strategy.",
      image: "races/elf.jpg"
    }, {
      name: 'Gnome',
      description: "Gnomes are welcome everywhere as technicians, alchemists, and inventors. Despite the demand for their skills, most gnomes prefer to remain among their own kind, living in comfortable burrows beneath rolling, wooded hills where animals abound.",
      image: "races/gnome.jpg"
    }, {
      name: 'Half-Elf',
      description: "Humans and elves sometimes wed, the elf attracted to the human’s energy and the human to the elf’s grace. These marriages end quickly as elves count years because a human’s life is so brief, but they leave an enduring legacy—half-elf children.
The life of a half-elf can be hard. If raised by elves, the half-elf seems to grow with astounding speed, reaching maturity within two decades. The half-elf becomes an adult long before she has had time to learn the intricacies of elven art and culture, or even grammar. She leaves behind her childhood friends, becoming physically an adult but culturally still a child by elven standards. Typically, she leaves her elven home, which is no longer familiar, and finds her way among humans.
If, on the other hand, she is raised by humans, the half-elf finds herself different from her peers: more aloof, more sensitive, less ambitious, and slower to mature. Some half-elves try to fit in among humans, while others find their identities in their difference. Most find places for themselves in human lands, but some feel like outsiders all their lives.",
      image: "races/half-elf.jpg"
    }, {
      name: 'Half-Orc',
      description: "In the wild frontiers, tribes of human and orc barbarians live in uneasy balance, fighting in times of war and trading in times of peace. Half-orcs who are born in the frontier may live with either human or orc parents, but they are nevertheless exposed to both cultures. Some, for whatever reason, leave their homeland and travel to civilized lands, bringing with them the tenacity, courage, and combat prowess that they developed in the wilds.",
      image: "races/half-orc.jpg"
    }, {
      name: 'Halfling',
      description: "Halflings are clever, capable opportunists. Halfling individuals and clans find room for themselves wherever they can. Often they are strangers and wanderers, and others react to them with suspicion or curiosity. Depending on the clan, halflings might be reliable, hard-working (if clannish) citizens, or they might be thieves just waiting for the opportunity to make a big score and disappear in the dead of night. Regardless, halflings are cunning,
resourceful survivors.",
      image: "races/halfling.jpg"
    }, {
      name: 'Human',
      description: "Most humans are the descendants of pioneers, conquerors, traders, travelers, refugees, and other people on the move. As a result, human lands are home to a mix of people—physically, culturally, religiously, and politically different. Hardy or fine, light-skinned or dark, showy or austere, primitive or civilized, devout or impious, humans run the gamut.",
      image: "races/human.jpg"
    }])

  DdClass.create([
    {
      name:'Barbarian',
      description: "From the frozen wastes of the north and the hellish jungles of the south come brave, even reckless, warriors. Civilized people call them barbarians or berserkers and suspect them of mayhem, impiety, and atrocities. These “barbarians,” however, have proven their mettle and their value to those who would be their allies. To enemies who underestimated them, they have proved their cunning, resource- fulness, persistence, and mercilessness.",
      image:"classes/barbarian.jpg"
    }, {
      name:'Bard',
      description: "It is said that music has a special magic, and the bard proves that saying true. Wandering across the land, gathering lore, telling sto- ries, working magic with his music, and living on the gratitude of his audience—such is the life of a bard. When chance or opportu- nity draws them into a conflict, bards serve as diplomats, negotia- tors, messengers, scouts, and spies.
A bard’s magic comes from the heart. If his heart is good, a bard brings hope and courage to the downtrodden and uses his tricks, music, and magic to thwart the schemes of evildoers. If the nobles of the land are corrupt, the good bard is an enemy of the state, cunningly evading capture and raising the spirits of the oppressed. But music can spring from an evil heart as well. Evil bards forego blatant violence in favor of manipulation, holding sway over the hearts and minds of others and taking what enraptured audiences “willingly” give.",
      image:"classes/bard.jpg"
    }, {
      name:'Cleric',
      description: "The handiwork of the gods is everywhere—in places of natural beauty, in mighty crusades, in soaring temples, and in the hearts of worshipers. Like people, gods run the gamut from benevolent to malicious, reserved to intrusive, simple to inscrutable. The gods, however, work mostly through intermediaries—their clerics. Good clerics heal, protect, and avenge. Evil clerics pillage, destroy, and sabotage. A cleric uses the power of his god to make his god’s will manifest. And if a cleric uses his god’s power to improve his own lot, that’s to be expected, too.",
      image:"classes/cleric.jpg"
    }, {
      name:'Druid',
      description: "The fury of a storm, the gentle strength of the morning sun, the cunning of the fox, the power of the bear—all these and more are at the druid’s command. The druid however, claims no mastery over nature. That claim, she says, is the empty boast of a city dweller. The druid gains her power not by ruling nature but by being at one with it. To trespassers in a druid’s sacred grove, and to those who feel her wrath, the distinction is overly fine.",
      image:"classes/druid.jpg"
    }, {
      name: 'Fighter',
      description: "Fighters are notorious for their abilities in all forms of warfare. The questing knight, the conquering overlord, the king’s champion, the elite foot soldier, the hardened mercenary, and the bandit king— all are fighters. Fighters can be stalwart defenders of those in need, cruel marauders, or gutsy adventurers. Some are among the land’s best souls, willing to face death for the greater good. Others are among the worst, with no qualms about killing for private gain, or even for sport. Fighters who are not actively adventuring may be soldiers, guards, bodyguards, champions, or criminal enforcers. An adventuring fighter might call himself a warrior, a
mercenary, a thug, or simply an adventurer. Adventures: Most fighters see adventures, raids, and dangerous missions as
￼their job. Some have patrons who pay them regularly. Others prefer to live like prospectors, taking great risks in hopes of the big haul. Some fighters are more civic-minded and use their combat skills to protect endangered people who cannot defend themselves. Whatever their initial motivations, however, fighters often wind up living for the thrill of
combat and adventure.",
      image: "classes/fighter.jpg"
    }, {
      name: "Monk",
      description: "Dotted across the landscape are monasteries—small, walled cloisters inhabited by monks who pursue personal perfection through action as well as contemplation. They train themselves to be versatile warriors skilled at fighting without weapons or armor. The inhabitants of monasteries headed by good masters serve as protectors of the people. Ready for battle even when barefoot and dressed in peasant clothes, monks can travel unnoticed among the populace, catching bandits, warlords, and corrupt nobles unawares. In contrast, the residents of monasteries headed by evil masters rule the surrounding lands through fear, as an evil warlord and his entourage might. Evil monks make ideal spies, infiltrators, and assassins.
The individual monk is unlikely to care passionately about championing commoners or amassing wealth. She cares primarily for the perfection of her art and, thereby, her personal perfection. Her goal is to achieve a state that is beyond the mortal realm.",
      image: "classes/monk.jpg"
    }, {
      name:'Paladin',
      description: "The compassion to pursue good, the will to uphold law, and the power to defeat evil—these are the three weapons of the paladin. Few have the purity and devotion that it takes to walk the paladin’s path, but those few are rewarded with the power to protect, to heal, and to smite. In a land of scheming wizards, unholy priests, bloodthirsty dragons, and infernal fiends, the paladin is the final hope that cannot be extinguished.",
      image:"classes/paladin.jpg"
    }, {
      name:'Ranger',
      description: "The forests are home to fierce and cunning creatures, such as bloodthirsty owlbears and malicious displacer
beasts. But more cunning and powerful than these monsters is the ranger, a skilled hunter and stalker. He knows the woods as if they were his home (as indeed they are), and he knows his prey in deadly detail.",
      image:"classes/ranger.jpg"
    }, {
      name:'Rogue',
      description: "Rogues share little in common with each other. Some are stealthy thieves. Others are silver-tongued tricksters. Still others are scouts, infiltrators, spies, diplomats, or thugs. What they share is versatility, adaptability, and resourcefulness. In general, rogues are skilled at getting what others don’t want them to get: entrance into a locked treasure vault, safe passage past a deadly trap, secret battle plans, a guard’s trust, or some random person’s pocket money.",
      image:"classes/rogue.jpg"
    }, {
      name:'Sorcerer',
      description: "Sorcerers create magic the way a poet creates poems, with inborn talent honed by practice. They have no books, no mentors, no theories—just raw
power that they direct at will.
Some sorcerers claim that the blood of dragons courses through their veins. That claim may even be true in some cases—it is common knowledge that certain powerful dragons can take humanoid form and even have humanoid lovers, and it’s difficult to prove that a given sorcerer does not have a dragon ancestor. It’s true that sorcerers often have striking good looks, usually with a touch of the exotic that hints at an unusual heritage. Others hold that the claim is either an unsubstantiated boast on the part of certain sorcerers or envious gossip on the part of those who lack
the sorcerer’s gift.",
      image:"classes/sorcerer.jpg"
    }, {
      name: 'Wizard',
      description: "A few unintelligible words and fleeting gestures carry more power than a battleaxe, when they are the words and gestures of a wizard. These simple acts make magic seem easy, but they only hint at the time the wizard must spend poring over her spellbook preparing each spell for casting, and the years before that spent in apprenticeship to learn the arts of magic.
Wizards depend on intensive study to create their magic. They examine musty old tomes, debate magical theory with their peers, and practice minor magics whenever they can. For a wizard, magic is not a talent but a difficult, rewarding art.",
      image: "classes/wizard.jpg"
    }])

  Skill.create([{name: "Climb", key_ability: "str", fighter_proficiency: 1, monk_proficiency: 1, wizard_proficiency: 2}])
  Skill.create([{name: "Concentration", key_ability: "const", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 1}])
  Skill.create([{name: "Heal", key_ability: "wis", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 2}])
  Skill.create([{name: "Intimidate", key_ability: "cha", fighter_proficiency: 1, monk_proficiency: 2, wizard_proficiency: 2}])
  Skill.create([{name: "Move Silently", key_ability: "dex", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 2}])
  Skill.create([{name: "Spellcraft", key_ability: "int", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 1}])