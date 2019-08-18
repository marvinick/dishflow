require 'rails_helper'

RSpec.describe "special_dishes/show", type: :view do
  before(:each) do
    @special_dish = assign(:special_dish, SpecialDish.create!(
      :name => "Name",
      :description => "MyText",
      :price => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
  end
end
