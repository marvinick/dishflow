require 'rails_helper'

RSpec.describe "special_dishes/index", type: :view do
  before(:each) do
    assign(:special_dishes, [
      SpecialDish.create!(
        :name => "Name",
        :description => "MyText",
        :price => 2.5
      ),
      SpecialDish.create!(
        :name => "Name",
        :description => "MyText",
        :price => 2.5
      )
    ])
  end

  it "renders a list of special_dishes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
