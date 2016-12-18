require 'rails_helper'

RSpec.describe "Weeks", type: :request do
  let(:bob) { create :admin }
  describe "GET /weeks" do
    it "works! (now write some real specs)" do
      login_as bob
      get weeks_path
      expect(response).to have_http_status(200)
    end
  end
end
