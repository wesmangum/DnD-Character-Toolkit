def login_as(user)
  if Capybara.current_driver.in? [:webkit, :poltergeist]
    user.confirm!
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "abc123123"
    click_on "Sign in"
 else
    user.confirm!
    page.driver.follow(:post, user_session_url, { user: { email: user.email, password: "abc123123"} })
 end
end