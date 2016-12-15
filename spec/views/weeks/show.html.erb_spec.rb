require 'rails_helper'

RSpec.describe "weeks/show", type: :view do
  before(:each) do
    @week = assign(:week, Week.create!(
      :from => 2,
      :to => 3,
      :month => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
