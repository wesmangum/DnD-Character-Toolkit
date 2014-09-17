# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Race.create([{name: 'Dwarf'}, {name: 'Elf'}])
  DdClass.create([{name: 'Fighter'}, {name: 'Wizard'}])

  Skill.create([{name: "Climb", key_ability: "str", fighter_proficiency: 1, monk_proficiency: 1, wizard_proficiency: 2}])
  Skill.create([{name: "Concentration", key_ability: "const", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 1}])
  Skill.create([{name: "Heal", key_ability: "wis", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 2}])
  Skill.create([{name: "Intimidate", key_ability: "cha", fighter_proficiency: 1, monk_proficiency: 2, wizard_proficiency: 2}])
  Skill.create([{name: "Move Silently", key_ability: "dex", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 2}])
  Skill.create([{name: "Spellcraft", key_ability: "int", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 1}])