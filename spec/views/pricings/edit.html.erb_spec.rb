require 'rails_helper'

RSpec.describe "pricings/edit", type: :view do
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  let!(:week1) { create :week, month_id: december.id }
  before(:each) do
    @pricing = assign(:pricing, Pricing.create!(
      :self_catered => "9.99",
      :weekend => "5.99",
      :week => week1
    ))
  end

  it "renders the edit pricing form" do
    render

    assert_select "form[action=?][method=?]", pricing_path(@pricing), "post" do

      assert_select "input#pricing_self_catered[name=?]", "pricing[self_catered]"

      assert_select "input#pricing_weekend[name=?]", "pricing[weekend]"

      assert_select "input#pricing_week_id[name=?]", "pricing[week_id]"
    end
  end
end
