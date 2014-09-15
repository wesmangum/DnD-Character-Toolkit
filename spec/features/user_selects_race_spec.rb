# ##User Selects a Race for a New Character

# As a User
# In order to continue cerating my Character
# I want to select a Race as the basis for my Character

# ###Acceptance Criteria
# * There should be a "Race" tab on the New Character screen
# * The User's Race selection should carry over to the other Character Creation sections

# ###Usage
# * A Page appears, where the User can choose their Race from a dropdown
#   * All of the selected Race's traits (speed, languages, etc.) will be listed
# * User will Confirm their Race selection by clicking "Submit Race"

feature "User Creates Character & Selects Race" do
  scenario "Happy Path" do
    seed_database()
    user = Fabricate(:user)
    login_as(user)
    click_on "Dashboard"
    click_on "Create a Character"
    expect(page).to have_content("You're on the first step to creating your character! The first step is to decide on a race. Select one from the dropdown below.")
    page.select('Dwarf', :from => 'character_race')
    click_on "Submit Race"
    current_path.should == character_classes_path(Character.first)
    expect(page).to have_content("Your Character's race was saved!")
    expect(Character.first.race).to eq(Race.find_by name: "Dwarf")
  end
end