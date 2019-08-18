require "rails_helper"

feature "Users can sign in" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "with a valid credentials" do
    visit "/"
    click_link "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"
    
    success_message = "Signed in successfully."
    expect(page).to have_content(success_message)
    # expect(page).to have_content "Signed in as #{user.email}"
  end
end
