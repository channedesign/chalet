require 'rails_helper'

RSpec.describe "Months", type: :request do
  describe "GET /months" do
    it "works! (now write some real specs)" do
      get months_path
      expect(response).to have_http_status(200)
    end
  end
end
