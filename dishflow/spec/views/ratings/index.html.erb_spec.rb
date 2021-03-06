require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :name => "Name",
        :description => "MyText",
        :menu => nil
      ),
      Rating.create!(
        :name => "Name",
        :description => "MyText",
        :menu => nil
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
