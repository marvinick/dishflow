require 'rails_helper'

RSpec.describe "SpecialDishes", type: :request do
  describe "GET /special_dishes" do
    it "works! (now write some real specs)" do
      get special_dishes_path
      expect(response).to have_http_status(200)
    end
  end
end
