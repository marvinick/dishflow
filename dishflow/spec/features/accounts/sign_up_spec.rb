require "rails_helper"

feature "Accounts" do
  scenario "creating an account" do
    visit root_path
    click_link("Create account", match: :first)
    fill_in("Name", with: "Test", match: :first)
    fill_in("Email", with: "test@example.com", match: :first)
    fill_in("Password", with: "Testpass", match: :first)
    fill_in("Password confirmation", with: "Testpass", match: :first)
    click_button("Create Account", match: :first)
    success_message = "Your account has been created."
    expect(page).to have_content(success_message)
  end
end
