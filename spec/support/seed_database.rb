def seed_database
  Fabricate(:race, name: "Dwarf", description: "Hard-headed and short of stature, the Dwarves fight for the flory of their houses.")
  Fabricate(:race, name: "Elf", description: "The elf are a mighty race, but vanity will be their downfall.")

  Fabricate(:dd_class, name: "Fighter")
  Fabricate(:dd_class, name: "Wizard")
  Fabricate(:dd_class, name: "Monk")

  Fabricate(:skill, name: "Climb", key_ability: "str", fighter_proficiency: 1, monk_proficiency: 1, wizard_proficiency: 2)
  Fabricate(:skill, name: "Concentration", key_ability: "const", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 1)
  Fabricate(:skill, name: "Heal", key_ability: "wis", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 2)
  Fabricate(:skill, name: "Intimidate", key_ability: "cha", fighter_proficiency: 1, monk_proficiency: 2, wizard_proficiency: 2)
  Fabricate(:skill, name: "Move Silently", key_ability: "dex", fighter_proficiency: 2, monk_proficiency: 1, wizard_proficiency: 2)
  Fabricate(:skill, name: "Spellcraft", key_ability: "int", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 1)
end