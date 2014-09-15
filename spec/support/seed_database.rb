def seed_database
  Fabricate(:race, name: "Dwarf")
  Fabricate(:race, name: "Elf")

  Fabricate(:dd_class, name: "Fighter")
  Fabricate(:dd_class, name: "Wizard")
end