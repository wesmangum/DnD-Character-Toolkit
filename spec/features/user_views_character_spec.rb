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
end