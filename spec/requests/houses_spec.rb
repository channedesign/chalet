require 'rails_helper'

RSpec.describe "Houses", type: :request do
  # post_via_redirect admin_session_path, 'admin[email]' => 'bob@sample.com', 'admin[password]' => 'Password'
  describe "GET /houses" do
    let!(:bob) { create :admin }
    it "works! (now write some real specs)" do
      login_as bob
      get houses_path
      expect(response).to have_http_status(200)
    end
  end
end
