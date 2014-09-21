def fill_out_character(forms=[])
  seed_database()
  user = Fabricate(:user)
  login_as(user)
  click_on "Dashboard"
  click_on "Create a Character"

  if forms.include?(:race)
    page.select('Dwarf', :from => 'character_race')
    click_on "Submit Race"
  end

  if forms.include?(:class)
    page.select('Fighter', :from => 'character_class')
    click_on "Submit Class"
  end

  if forms.include?(:abilities)
    click_on "Generate"
    str = field_labeled("Strength").all("option")[1].value
    dex = field_labeled("Dexterity").all("option")[2].value
    const = field_labeled("Constitution").all("option")[3].value
    int = field_labeled("Intelligence").all("option")[4].value
    wis = field_labeled("Wisdom").all("option")[5].value
    cha = field_labeled("Charisma").all("option").last.value

    select(str, from: "Strength")
    select(dex, from: "Dexterity")
    select(const, from: "Constitution")
    select(int, from: "Intelligence")
    select(wis, from: "Wisdom")
    select(cha, from: "Charisma")
    click_on "Submit Abilities"

    character = Character.last
    character.selected = {
      :str => "11",
      :dex => "12",
      :const => "13",
      :int => "14",
      :wis => "15",
      :cha => "16"
    }
    character.generated = [11, 12, 13, 14, 15, 16]
    character.update_attributes(character.selected)
  end

  if forms.include?(:skills)
    select(4, from: "Climb")
    select(2, from: "Concentration")
    select(2, from: "Heal")
    select(4, from: "Intimidate")
    select(2, from: "Move Silently")
    select(2, from: "Spellcraft")
    click_on "Submit Skills"
  end

  if forms.include?(:description)
    fill_in "Name", with: "Gimley"
    select "Male", from: "Sex"
    select "58", from: "Height"
    select "175", from: "Weight"
    select "Lawful Good", from: "Alignment"
    fill_in "Background", with: "A warrior from the royal family of Garlamaing representing his race in the free world."
    fill_in "Personality", with: "Hard-headed and doesn't typically get along with orcs."
    fill_in "Physical Appearance", with: "Taller for a dwarf. Unique blonde hair, and very muscular, even by drawf standards."
    click_on "Submit Description"
  end
end