require 'rails_helper'

RSpec.describe "pricings/edit", type: :view do
  before(:each) do
    @pricing = assign(:pricing, Pricing.create!(
      :self_catered => "9.99",
      :week => nil
    ))
  end

  it "renders the edit pricing form" do
    render

    assert_select "form[action=?][method=?]", pricing_path(@pricing), "post" do

      assert_select "input#pricing_self_catered[name=?]", "pricing[self_catered]"

      assert_select "input#pricing_week_id[name=?]", "pricing[week_id]"
    end
  end
end
