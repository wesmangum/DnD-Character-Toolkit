# ##User Selects a Class for a New Character

# As a User
# In order to define my Character and their skillset
# I wnat to select a Class for my Character

# ###Acceptance Criteria
# * A Page appears, where the User can choose a Class from a dropdown
# * When the User selects a Class, the Base Stats for the character will be updated
# * The User's Class selection should carry over to the other character Creation Sections

# ###Usage
# * Once they have confirmed their race, They click "Class" to Choose a Class from a dropdown
#   * When a Class is selected, the Class' features and proficiency bonus is listed for level 1
#   * Likewise, the Hit Die for the character is shown upon selection, along with the Character's Hit Point Maximum
# * User will confirm their Class selection by clicking on another section to continue ther Character Creation

feature "User Selects Class" do
  scenario "Happy Path" do
    seed_database()
    user = Fabricate(:user)
    login_as(user)
    click_on "Dashboard"
    click_on "Create a Character"
    page.select('Dwarf', :from => 'character_race')
    click_on "Submit Race"

    expect(page).to have_content("Great! Now, select your class.")
    page.select('Fighter', :from => 'character_class')
    click_on "Submit Class"
    expect(page).to have_content("Your Character's class was saved!")
    expect(Character.first.dd_class).to eq(DdClass.find_by name: "Fighter")
  end
end