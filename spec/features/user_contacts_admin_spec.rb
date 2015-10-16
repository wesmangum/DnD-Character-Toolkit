# ##User Contacts Admin

# As a user
# In order to report bugs or suggest features
# I want to contact the creator of this application

# ###Acceptance Criteria
# * The User should be able to visit a Contact page
# * The User should be presented with fields to fill out email, name, and message
# * The "Send" button should submit the form and send a copy of the email to both the admin

# ###Usage
# * From the any screen, the User clicks the "Contact" button in the bashboard
# * They are taken to a page with a form containing the fields "Email", "Subject", and "Body"
# * They fill out the form with their inquiry and click the "Send" button
# * They are then redirected to the Dashboard, where they will receive a confirmation notification that their message was sent

feature "User Contacts Admin" do
  scenario "Happy Path, should successfully send message" do
    visit '/'
    click_on "Contact"
    current_path.should eq contacts_path
    fill_in "Name", with: "Albert Example"
    fill_in "Email", with: "a@example.com"
    fill_in "Message", with: "Some message about an issue with the site or a suggestion for a feature."
    click_on "Send"
    current_path.should eq "/"
    expect(page).to have_content("Your message was delivered successfully")

    expect(ActionMailer::Base.deliveries.count).to eq 1
    expect(ActionMailer::Base.deliveries.first.from).to include "Albert Example"
    expect(ActionMailer::Base.deliveries.first.to).to include "admin@dndcharactertoolkit.com"
  end

  scenario "Sad Path, user fails to fill out email" do\
    visit contacts_path
    fill_in "Name", with: "Albert Example"
    fill_in "Message", with: "Some message"
    click_on "Send"
    current_path.should eq contacts_path
    expect(page).to have_content("Cannot send message")

    expect(ActionMailer::Base.deliveries.count).to eq 0
  end
end