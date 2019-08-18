require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :food_id => 1,
      :public => "MyText",
      :private => "MyText",
      :properties => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[food_id]"

      assert_select "textarea[name=?]", "review[public]"

      assert_select "textarea[name=?]", "review[private]"

      assert_select "textarea[name=?]", "review[properties]"
    end
  end
end
