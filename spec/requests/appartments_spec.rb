require 'rails_helper'

RSpec.describe "Appartments", type: :request do
  let!(:bob) { create :admin }
  describe "GET /appartments" do

    it "works! (now write some real specs)" do
      login_as bob
      get appartments_path
      expect(response).to have_http_status(200)
    end
  end
end
