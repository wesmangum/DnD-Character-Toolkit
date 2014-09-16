feature "User assigns Ability Scores to Character", :js => true do
    background do
      seed_database()
      user = Fabricate(:user)
      login_as(user)
      click_on "Dashboard"
      click_on "Create a Character"
      page.select('Dwarf', :from => 'character_race')
      click_on "Submit Race"
      page.select('Fighter', :from => 'character_class')
      click_on "Submit Class"
    end

  scenario "Happy Path" do

    expect(page).to have_content("Now, it's time to generate and assign Ability Scores. Click the 'Generate' button below to roll 6 numbers.")
    click_on "Generate"
    expect(page).to have_css(".score", count: 6)

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

    character = Character.first
    current_path.should == character_skills_path(character)
    expect(character.str).to eq(str.to_i)
    expect(character.dex).to eq(dex.to_i)
    expect(character.const).to eq(const.to_i)
    expect(character.int).to eq(int.to_i)
    expect(character.wis).to eq(wis.to_i)
    expect(character.cha).to eq(cha.to_i)
  end

  scenario "Sad Path, User gets greedy" do

    current_path.should == character_abilities_path(Character.first)
    expect(page).to have_content("Now, it's time to generate and assign Ability Scores. Click the 'Generate' button below to roll 6 numbers.")
    click_on "Generate"
    expect(page).to have_css(".score", count: 6)

    best_score = field_labeled("Strength").all("option")[1].value

    select(best_score, from: "Strength")
    select(best_score, from: "Dexterity")
    select(best_score, from: "Constitution")
    select(best_score, from: "Intelligence")
    select(best_score, from: "Wisdom")
    select(best_score, from: "Charisma")
    click_on "Submit Abilities"

    character = Character.first
    current_path.should == character_abilities_path(character)

    expect(character.str).to be_nil
    expect(character.dex).to be_nil
    expect(character.const).to be_nil
    expect(character.int).to be_nil
    expect(character.wis).to be_nil
    expect(character.cha).to be_nil
  end

  scenario "Sad Path, User doesn't select all Ability scores" do

    current_path.should == character_abilities_path(Character.first)
    expect(page).to have_content("Now, it's time to generate and assign Ability Scores. Click the 'Generate' button below to roll 6 numbers.")
    click_on "Generate"
    expect(page).to have_css(".score", count: 6)

    str = field_labeled("Strength").all("option")[1].value
    select(str, from: "Strength")
    click_on "Submit Abilities"

    character = Character.first
    current_path.should == character_abilities_path(character)

    expect(character.str).to be_nil
    expect(character.dex).to be_nil
    expect(character.const).to be_nil
    expect(character.int).to be_nil
    expect(character.wis).to be_nil
    expect(character.cha).to be_nil
  end
end