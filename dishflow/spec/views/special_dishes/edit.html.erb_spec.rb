require 'rails_helper'

RSpec.describe "special_dishes/edit", type: :view do
  before(:each) do
    @special_dish = assign(:special_dish, SpecialDish.create!(
      :name => "MyString",
      :description => "MyText",
      :price => 1.5
    ))
  end

  it "renders the edit special_dish form" do
    render

    assert_select "form[action=?][method=?]", special_dish_path(@special_dish), "post" do

      assert_select "input[name=?]", "special_dish[name]"

      assert_select "textarea[name=?]", "special_dish[description]"

      assert_select "input[name=?]", "special_dish[price]"
    end
  end
end
