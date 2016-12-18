require 'rails_helper'

RSpec.describe "pricings/index", type: :view do
  before(:each) do
    assign(:pricings, [
      Pricing.create!(
        :self_catered => "9.99",
        :week => nil
      ),
      Pricing.create!(
        :self_catered => "9.99",
        :week => nil
      )
    ])
  end

  it "renders a list of pricings" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
