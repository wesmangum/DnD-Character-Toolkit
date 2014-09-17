# ##User Assigns Skill Points for a New Character

# As a User
# In order to determine my what my character is good at
# I want to assign skill points to different skills

# ###Acceptance Criteria
# * A Page appears, where the User sees their available Skill points
# * A User should be able to assign points to specific skills
# * A cross-class skill should deprecate the skill points by 2 for every 1 level
# * This tab should be blocked until Race and Class are selected

# ###Usage
# * Once Ability scores have been confirmed, User is prompted with score modifiers and all skills
#   * User will click arrows to add skill points to a specific skill
# * When they are satisfied with their skills, they will click "Submit Skills" to continue the Character Creation Process

feature "User assigns skill points", :js => true do
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
  end

  scenario "Happy path" do
    pending "character skill model implementation"
    current_path.should == character_skills_path(Character.first)
    expect(page).to have_content("Now that Ability scores are out of the way, let's figure out your character's skills.")
    expect(page).to have_content("Your number of Skill points is determined from your intelligence.")
    expect(page).to have_content("Each Skill your are proficient in is marked blue. These sills only take one skill point to advance.")
    expect(page).to have_content("Skills marked in red are cross-class skills. You will need to invest two skill points to advance one level.")

    expect(page).to have_content("You'll notice that Skills already have numbers next to them. Those are determined from your Ability Modifiers, listed below.")
    expect(page).to have_content("Strength Modifier:")
    expect(page).to have_content("Dexterity Modifier:")
    expect(page).to have_content("Constitution Modifier:")
    expect(page).to have_content("Intelligence Modifier:")
    expect(page).to have_content("Wisdom Modifier:")
    expect(page).to have_content("Charisma Modifier:")

    expect(page).to have_content("Climb") #str
    expect(page).to have_content("Concentration") #const
    expect(page).to have_content("Heal") #wis
    expect(page).to have_content("Intimidate") #cha
    expect(page).to have_content("Move Silently") #dex
    expect(page).to have_content("Spellcraft") #int



  end
end