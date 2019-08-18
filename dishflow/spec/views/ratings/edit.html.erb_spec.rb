require 'rails_helper'

RSpec.describe "ratings/edit", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :name => "MyString",
      :description => "MyText",
      :menu => nil
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input[name=?]", "rating[name]"

      assert_select "textarea[name=?]", "rating[description]"

      assert_select "input[name=?]", "rating[menu_id]"
    end
  end
end
