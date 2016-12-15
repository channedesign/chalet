require 'rails_helper'

RSpec.describe "appartments/show", type: :view do
  before(:each) do
    @appartment = assign(:appartment, Appartment.create!(
      :name => "Name",
      :house => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
