require 'rails_helper'

RSpec.describe "special_dishes/new", type: :view do
  before(:each) do
    assign(:special_dish, SpecialDish.new(
      :name => "MyString",
      :description => "MyText",
      :price => 1.5
    ))
  end

  it "renders new special_dish form" do
    render

    assert_select "form[action=?][method=?]", special_dishes_path, "post" do

      assert_select "input[name=?]", "special_dish[name]"

      assert_select "textarea[name=?]", "special_dish[description]"

      assert_select "input[name=?]", "special_dish[price]"
    end
  end
end
