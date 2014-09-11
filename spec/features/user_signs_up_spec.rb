feature "User Signs Up, logs out, then signs in" do
  scenario "Happy Path, using Email & Password" do
    visit '/'
    click_on "Sign Up"
    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "abc123123"
    fill_in "Password Confirmation", with: "abc123123"
    click_on "Create Account"
    current_path.should eq '/'
    expect(User.count).to eq 1

    click_on "Sign Out"
    current_path.should eq '/'
    click_on "Sign In"
    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "abc123123"
    click_on "Sign in"
    current_path.should eq '/'
    expect(page).to have_content('Signed in successfully')
  end

  scenario "Happy Path, using Facebook" do
    sign_into_facebook_as "joe"
    visit root_path
    click_on "Sign In"
    click_link "Sign in with Facebook"
    page.should have_content "Successfully authenticated from Facebook account."
    page.should have_content "Sign Out"
    page.should_not have_content "Sign In"

    click_link "Sign Out"
    page.should_not have_content "Sign Out"
    click_on "Sign In"
    page.should have_content "Sign in with Facebook"
    User.where(
      email: "joesmith@example.com",
      name: "Joe Smith",
      uid: "12345"
    ).count.should == 1
    User.count.should == 1
  end

  scenario "Happy Path, using Twitter" do
    sign_into_twitter_as "joe"
    visit root_path
    click_on "Sign In"
    click_link "Sign in with Twitter"
    page.should have_content "Successfully authenticated from Twitter account."
    page.should have_content "Sign Out"
    page.should_not have_content "Sign In"

    click_link "Sign Out"
    page.should_not have_content "Sign Out"
    click_on "Sign In"
    page.should have_content "Sign in with Twitter"
    User.where(
      email: "joe@twitter.com",
      name: "Joe Smith",
      uid: "12345"
    ).count.should == 1
    User.count.should == 1
  end
end