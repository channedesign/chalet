require 'rails_helper'

RSpec.describe "pricings/show", type: :view do
  before(:each) do
    @pricing = assign(:pricing, Pricing.create!(
      :self_catered => "9.99",
      :weekend => "5.99",
      :week => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/5.99/)
    expect(rendered).to match(//)
  end
end
