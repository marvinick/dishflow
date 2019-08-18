require "rails_helper"

RSpec.describe SpecialDishesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/special_dishes").to route_to("special_dishes#index")
    end

    it "routes to #new" do
      expect(:get => "/special_dishes/new").to route_to("special_dishes#new")
    end

    it "routes to #show" do
      expect(:get => "/special_dishes/1").to route_to("special_dishes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/special_dishes/1/edit").to route_to("special_dishes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/special_dishes").to route_to("special_dishes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/special_dishes/1").to route_to("special_dishes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/special_dishes/1").to route_to("special_dishes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/special_dishes/1").to route_to("special_dishes#destroy", :id => "1")
    end
  end
end
