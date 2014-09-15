feature "User assigns Ability Scores to Character", :js => true do
  scenario "Happy Path" do
    seed_database()
    user = Fabricate(:user)
    login_as(user)
    click_on "Dashboard"
    click_on "Create a Character"
    page.select('Dwarf', :from => 'character_race')
    click_on "Submit Race"
    page.select('Fighter', :from => 'character_class')
    click_on "Submit Class"

    current_path.should == character_abilities_path(Character.first)
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
    expect(character.str).to eq(str.to_i)
    expect(character.dex).to eq(dex.to_i)
    expect(character.const).to eq(const.to_i)
    expect(character.int).to eq(int.to_i)
    expect(character.wis).to eq(wis.to_i)
    expect(character.cha).to eq(cha.to_i)
  end
end