require 'rails_helper'

RSpec.describe "Months", type: :request do
  let(:bob) { create :admin }
  describe "GET /months" do
    it "works! (now write some real specs)" do
      login_as bob
      get months_path
      expect(response).to have_http_status(200)
    end
  end
end
