require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :food_id => 1,
      :public => "MyText",
      :private => "MyText",
      :properties => "MyText"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[food_id]"

      assert_select "textarea[name=?]", "review[public]"

      assert_select "textarea[name=?]", "review[private]"

      assert_select "textarea[name=?]", "review[properties]"
    end
  end
end
