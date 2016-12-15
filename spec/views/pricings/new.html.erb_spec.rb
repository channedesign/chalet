require 'rails_helper'

RSpec.describe "pricings/new", type: :view do
  before(:each) do
    assign(:pricing, Pricing.new(
      :price => "9.99",
      :week => nil
    ))
  end

  it "renders new pricing form" do
    render

    assert_select "form[action=?][method=?]", pricings_path, "post" do

      assert_select "input#pricing_price[name=?]", "pricing[price]"

      assert_select "input#pricing_week_id[name=?]", "pricing[week_id]"
    end
  end
end
