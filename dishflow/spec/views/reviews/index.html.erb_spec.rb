require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :food_id => 2,
        :public => "MyText",
        :private => "MyText",
        :properties => "MyText"
      ),
      Review.create!(
        :food_id => 2,
        :public => "MyText",
        :private => "MyText",
        :properties => "MyText"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
