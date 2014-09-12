# ##User Creates Account Using Email & Password

# As a User
# In order to record my characters
# I want to Create an Acccount using Email & Password

# ###Acceptance Criteria:
# * Users should be able to click or "Email & Password" for their choice of creating an account
# * They should be taken to a new account page, where they put in their desired email and password
#   * Email verification through new user Email
# * User should be able to use same credentials when logging in later

# ###Usage:
# * User visits the homepage, and clicks on 'Create Account'
# * A modal pops up with the option "Email & Password"
# * User is sent to the New Account page, where they put in their desired email and password
# * An email is sent to the user, where they will click the "Activate Your Account button"
# * User is redirected to their dashboard


# ##User Creates Account Using Facebook

# As a User
# In order to record my characters
# I want to Create an Acccount using my Facebook Account

# ###Acceptance Criteria:
# * Users should be able to click or "Connect with Facebook" for their choice of creating an account
# * They should be redirected to the Facebook login page, where they put in their Facebook credentials
# * User should be able to use click "Log in with Facebook" from "Log In" page to view their account

# ###Usage
# * User visits the homepage, and clicks on 'Create Account'
# * A modal pops up with the option "Connect with Facebook"
# * User is sent to the Facebook login page, where they put in their Facebook Login credentials
# * User is redirected to their dashboard


# ##User Creates Account Using Twitter

# As a User
# In order to record my characters
# I want to Create an Acccount using my Twitter Account

# ###Acceptance Criteria
# * Users should be able to click or "Connect with Twitter" for their choice of creating an account
# * They should be redirected to the Twitter login page, where they put in their Twitter credentials
# * User should be able to use click "Log in with Twitter" from "Log In" page to view their account

# ###Usage
# * User visits the homepage, and clicks on 'Create Account'
# * A modal pops up with the option "Connect with Twitter"
# * User is sent to the Twitter login page, where they put in their Twitter Login credentials
# * User is redirected to their dashboard
# * User is Redirected to Dashboard

feature "User Signs Up, logs out, then signs in" do
  background do
    ActionMailer::Base.deliveries.clear
  end
  scenario "Happy Path, using Email & Password" do
    visit '/'
    click_on "Sign Up"
    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "abc123123"
    fill_in "Password Confirmation", with: "abc123123"
    fill_in "Name", with: "Joe Smith"
    click_on "Create Account"
    current_path.should eq '/'
    expect(User.count).to eq 1
    expect(ActionMailer::Base.deliveries.count).to eq 1

    User.last.confirm!
    click_link "Sign In"
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