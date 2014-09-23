feature "User views character", :js => true do
  background do
    fill_out_character([:race, :class, :abilities, :skills, :description])
    click_on "Confirm Character"
  end

  scenario "Happy path, user selects character to view" do
    current_path.should == user_path(Character.first.user)
    click_on "View"

    current_path.should == character_path(Character.first)

    expect(page).to have_content("Gimley")
  end

  scenario "Sad path, user tries to visit character without logging in" do
    click_on("Sign Out")

    visit character_path(Character.first)
    current_path.should == root_path
    expect(page).to have_content("You are not authorized to visit this page.")
  end

  scenario "Sad Path, user tries to view a character that does not belong to them" do
    click_on("Sign Out")
    sign_into_facebook_as("John")

    visit character_path(Character.first)
    current_path.should == root_path
    expect(page).to have_content("You are not authorized to visit this page.")
  end
end