# ##User Creates a Character

# As a User
# In order to begin my Adventure
# I want to create a new Character

# ###Acceptance Criteria:
# * Once logged in, Users should be able to click the "Create a Character" button on their dashboard
#   * If they already have characters, there should be a list below the button
# * Users should be redirected to the New Character page
# * The steps to create a new character should guide the User without any confusion

# ###Usage:
# * User visits their dashboard, and clicks on "Create a Character"
# * The User is taken to the Character Creation screen, where they may begin making a Character with tabs for:
#   * Race
#   * Class
#   * Description
#   * Abilities
#   * Equipment

feature "User Creates Character" do

  scenario "Happy Path" do
    user = Fabricate(:user)
    login_as(user)
    expect(page).to_not have_content "Sign In"
    click_on "Dashboard"
    click_on "Create a Character"
    expect(page).to have_content("Race")
    expect(page).to have_content("Class")
    expect(page).to have_content("Description")
    expect(page).to have_content("Abilities")
    expect(page).to have_content("Equipment")
    expect(page).to have_content("To create a character click on 'Race'.")
    expect(page).to have_css('a.disabled', :count => 3)
  end
end