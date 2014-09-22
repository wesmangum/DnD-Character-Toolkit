# ##User Saves their New Character

# As a user
# In order to use my character between sessions
# I want to save my Character to my account

# ###Acceptance Criteria
# * The User should be able to review their Character before saving it to the Database
# * The "Save" button should be blocked until all required fields are filled out

# ###Usage
# * When the User is ready , they can click the "Finalize" button begin the saving process.
# * They are taken to a confirmation screen for their Character, where they can review and make changes accordingly
# * When Ready, they may click "Confirm Character" to save their character to the DB
# * They are then redirected to the Dashboard, where thier character will be listed

feature "User confirms character", :js => true do

  background do
    fill_out_character([:race, :class, :abilities, :skills, :description])
  end

  scenario "Happy Path" do
    current_path.should == character_confirm_path(Character.first)

    expect(page).to have_content("Review your character to make sure everything looks good.")
    expect(page).to have_content("Gimley")
    expect(page).to have_content("Dwarf")
    expect(page).to have_content("Fighter")
    expect(page).to have_content("Weight: 175 lbs.")
    expect(page).to have_content("Strength 11")
    expect(page).to have_content("A warrior from the royal family of Garlamaing representing his race in the free world.")

    click_on "Confirm Character"

    current_path.should == user_path(Character.first.user)

    expect(page).to have_content("Gimley")
  end
end