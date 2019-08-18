require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      :name => "MyString",
      :description => "MyText",
      :menu => nil
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input[name=?]", "rating[name]"

      assert_select "textarea[name=?]", "rating[description]"

      assert_select "input[name=?]", "rating[menu_id]"
    end
  end
end
