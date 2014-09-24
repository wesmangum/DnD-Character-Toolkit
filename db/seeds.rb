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
      description: "Hard-headed and short of stature, the Dwarves fight for the glory of their houses.",
      image: "races/dwarf.jpg"
    }, {
      name: 'Elf',
      description: "The elf are a mighty race, but vanity will be their downfall.",
      image: "races/elf.jpg"
    }, {
      name: 'Human',
      description: "Not the most powerful race, but definitely the most numerous and craftiest. Their adaptabiity knows no rival.",
      image: "races/human.jpg"
    }])

  DdClass.create([
    {
      name: 'Fighter',
      description: "Fighters are notorious for their abilities in all forms of warfare. The questing knight, the conquering overlord, the king’s champion, the elite foot soldier, the hardened mercenary, and the bandit king— all are fighters. Fighters can be stalwart defenders of those in need, cruel marauders, or gutsy adventurers. Some are among the land’s best souls, willing to face death for the greater good. Others are among the worst, with no qualms about killing for private gain, or even for sport. Fighters who are not actively adventuring may be soldiers, guards, bodyguards, champions, or criminal enforcers. An adventuring fighter might call himself a warrior, a
mercenary, a thug, or simply an adventurer. Adventures: Most fighters see adventures, raids, and dangerous missions as
￼their job. Some have patrons who pay them regularly. Others prefer to live like prospectors, taking great risks in hopes of the big haul. Some fighters are more civic-minded and use their combat skills to protect endangered people who cannot defend themselves. Whatever their initial motivations, however, fighters often wind up living for the thrill of
combat and adventure.",
      image: "classes/fighter.jpg"
    }, {
      name: 'Wizard',
      description: "A few unintelligible words and fleeting gestures carry more power than a battleaxe, when they are the words and gestures of a wizard. These simple acts make magic seem easy, but they only hint at the time the wizard must spend poring over her spellbook preparing each spell for casting, and the years before that spent in apprenticeship to learn the arts of magic.
Wizards depend on intensive study to create their magic. They examine musty old tomes, debate magical theory with their peers, and practice minor magics whenever they can. For a wizard, magic is not a talent but a difficult, rewarding art.",
      image: "classes/wizard.jpg"
    }, {
      name: "Monk",
      description: "Dotted across the landscape are monasteries—small, walled cloisters inhabited by monks who pursue personal perfection through action as well as contemplation. They train themselves to be versatile warriors skilled at fighting without weapons or armor. The inhabitants of monasteries headed by good masters serve as protectors of the people. Ready for battle even when barefoot and dressed in peasant clothes, monks can travel unnoticed among the populace, catching bandits, warlords, and corrupt nobles unawares. In contrast, the residents of monasteries headed by evil masters rule the surrounding lands through fear, as an evil warlord and his entourage might. Evil monks make ideal spies, infiltrators, and assassins.
The individual monk is unlikely to care passionately about championing commoners or amassing wealth. She cares primarily for the perfection of her art and, thereby, her personal perfection. Her goal is to achieve a state that is beyond the mortal realm.",
      image: "classes/monk.jpg"
    }])

  Skill.create([{name: "Climb", key_ability: "str", fighter_proficiency: 1, monk_proficiency: 1, wizard_proficiency: 2}])
  Skill.create([{name: "Concentration", key_ability: "const", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 1}])
  Skill.create([{name: "Heal", key_ability: "wis", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 2}])
  Skill.create([{name: "Intimidate", key_ability: "cha", fighter_proficiency: 1, monk_proficiency: 2, wizard_proficiency: 2}])
  Skill.create([{name: "Move Silently", key_ability: "dex", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 2}])
  Skill.create([{name: "Spellcraft", key_ability: "int", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 1}])