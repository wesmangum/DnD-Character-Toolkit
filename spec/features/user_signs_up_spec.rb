feature "User Signs Up, logs out, then signs in" do
  scenario "Happy Path, using Email & Password" do
    visit '/'
    click_on "Sign Up"
    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "a@abc123"
    fill_in "Password Confirmation", with: "a@abc123"
    click_on "Create Account"
    current_path.should eq '/'
    expect(User.count).to eq 1

    click_on "Sign Out"
    current_path.should eq '/'
    click_on "Sign In"
    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "abc123"
    click_button "Sign in"
  end

  scenario "Happy Path, using Facebook" do
    visit '/'
    click_on "Sign Up"
    click_on "Connect with Facebook"
    current_path.should eq '/'
    expect(User.count).to eq 1

    click_on "Sign Out"
    current_path.should eq '/'
    click_on "Sign In"
    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "abc123"
    click_button "Sign in"
  end
end