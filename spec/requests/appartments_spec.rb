require 'rails_helper'

RSpec.describe "Appartments", type: :request do
  describe "GET /appartments" do
    it "works! (now write some real specs)" do
      get appartments_path
      expect(response).to have_http_status(200)
    end
  end
end
