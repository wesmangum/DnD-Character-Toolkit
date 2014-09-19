# ##User Fleshes out Description of New Character

# As a User
# In order to make my character a living being in this fantasy universe
# I want to add description to my character

# ###Acceptance Criteria
# * A Page appears, where the User can select the various details of their Character
# * The User should have various dropdowns, all affected by their previous choices
# * This tab should be blurred out until Race & Class are selected
# * Height and Weight should be effected by the race of the Character
# * Ideals should not be selectable until Background is selected

# ###Usage
# * Once Class & Race are selected, the User clicks "Description" to fill out the Character's Description:
#   * Name (Text)
#   * Sex (Male/Female)
#   * Height (Slider determined from Race)
#   * Weight (Slider determined from Race)
#   * Alignment (Dropdown)
#   * Background (Text)
#   * Personality (Text)
#   * Physical Appearance (Text)

feature "User fleshes out description for character", :js => true do
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

    select(4, from: "Climb")
    select(2, from: "Concentration")
    select(2, from: "Heal")
    select(4, from: "Intimidate")
    select(2, from: "Move Silently")
    select(2, from: "Spellcraft")
    click_on "Submit Skills"
  end

  scenario "Happy Path, all fields filled out" do
    current_path.should == character_description_index_path(Character.first)

    expect(page).to have_content("Great job distributing those skill points! Now that we're done with numbers, it's time to flesh out your Character.")
    expect(page).to have_content("The only fields that are required are Name, Sex, Weight, Height, and Alignment. Everything else is up to you.")

    fill_in "Name", with: "Gimley"
    select "Male", from: "Sex"
    select "58", from: "Height"
    select "175", from: "Weight"
    select "Lawful Good", from: "Alignment"
    fill_in "Background", with: "A warrior from the royal family of Garlamaing representing his race in the free world."
    fill_in "Personality", with: "Hard-headed and doesn't typically get along with orcs."
    fill_in "Physical Appearance", with: "Taller for a dwarf. Unique blonde hair, and very muscular, even by drawf standards."
    click_on "Submit Description"

    character = Character.last
    expect(character.name).to eq "Gimley"
    expect(character.sex).to eq "Male"
    expect(character.height).to eq 58
    expect(character.weight).to eq 175
    expect(character.alignment).to eq "Lawful Good"
    expect(character.background).to have_content "warrior"
    expect(character.personality).to have_content "orcs."
    expect(character.appearance).to have_content "blonde"
  end

  scenario "Happy Path, all required fields filled out" do
    current_path.should == character_description_index_path(Character.first)

    expect(page).to have_content("Great job distributing those skill points! Now that we're done with numbers, it's time to flesh out your Character.")
    expect(page).to have_content("The only fields that are required are Name, Sex, Weight, Height, and Alignment. Everything else is up to you.")

    fill_in "Name", with: "Gimley"
    select "Male", from: "Sex"
    select "58", from: "Height"
    select "175", from: "Weight"
    select "Lawful Good", from: "Alignment"
    click_on "Submit Description"

    character = Character.last
    expect(character.name).to eq "Gimley"
    expect(character.sex).to eq "Male"
    expect(character.height).to eq 58
    expect(character.weight).to eq 175
    expect(character.alignment).to eq "Lawful Good"
    expect(character.background).to eq ""
    expect(character.personality).to eq ""
    expect(character.appearance).to eq ""
  end

  scenario "Sad Path, required fields not filled out" do
      current_path.should == character_description_index_path(Character.first)

      expect(page).to have_content("Great job distributing those skill points! Now that we're done with numbers, it's time to flesh out your Character.")
      expect(page).to have_content("The only fields that are required are Name, Sex, Weight, Height, and Alignment. Everything else is up to you.")

      click_on "Submit Description"

      expect(page).to have_content "The character could not be saved"

      character = Character.last
      expect(character.name).to be_nil
      expect(character.sex).to be_nil
      expect(character.height).to be_nil
      expect(character.weight).to be_nil
      expect(character.alignment).to be_nil
      expect(character.background).to be_nil
      expect(character.personality).to be_nil
      expect(character.appearance).to be_nil
    end
end
