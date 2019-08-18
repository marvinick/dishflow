require "rails_helper"

feature "Users can view menus" do
  scenario 'with the menu details' do
    menu = FactoryBot.create(:menu, name: "Sublime Text 3")
    visit "/"
    click_link "Sublime Text 3"
    expect(page.current_url).to eq menu_url(menu)
  end
end 
