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

feature "User Creates Character & Selects Race", :js => true do
  background do
    fill_out_character()
  end

  scenario "Happy Path" do
    expect(page).to have_content("You're on the first step to creating your character! The first step is to decide on a race. Select one from the dropdown below.")
    page.select('Elf', :from => 'character_race')
    expect(page).to have_content("The elf are a mighty race, but vanity will be their downfall.")
    click_on "Submit Race"
    current_path.should == character_classes_path(Character.first)
    expect(page).to have_content("Your Character's race was saved!")
    expect(Character.first.race).to eq(Race.find_by name: "Elf")
  end

  scenario "Sad Path, user does not select a race" do
    expect(page).to have_content("You're on the first step to creating your character! The first step is to decide on a race. Select one from the dropdown below.")
    click_on "Submit Race"
    current_path.should == character_races_path(Character.first)
    expect(page).to have_content("Your Character could not be saved.")
    expect(Character.first.race).to be_nil
  end
end