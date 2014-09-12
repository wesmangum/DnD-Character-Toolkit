# ##User Selects a Race for a New Character

# As a User
# In order to continue cerating my Character
# I want to select a Race as the basis for my Character

# ###Acceptance Criteria
# * There should be a "Race" tab on the New Character screen
# * When a User selects a base Race, a second dropdown should appear with all of that Race's subRaces
# * When the Race selection is done, a table with the Character's Base stats should appear on the page
# * The User's Race selection should carry over to the other Character Creation sections

# ###Usage
# * A Page appears, where the User can choose their Race from a dropdown
#   * If the race has SubRaces, a second dropdown will appear with those choices
#   * When a (sub)race is selected, a table with the race's base stats will show
#   * All of the selected Race's traits (speed, languages, etc.) will be listed
# * User will Confirm their Race selection by clicking on

feature "User Creates Character & Selects Race" do
  scenario "Happy Path" do
    pending "Race Model Implementation"
    user = Fabricate(:user)
    login_as(user)
    click_on "Dashboard"
    click_on "Create a Character"
    click_on "Race"
    expect(page).to have_content("Select a base Race. Then, choose your Sub Race.")
    page.select('Dwarf', :from => 'races')
    page.select('Hill Dwarf', :from => 'subraces')
    expect(page).to have_content("Strength")
    expect(Character.last.race.subrace).to eq "Hill Dwarf"
  end
end