require 'rails_helper'

RSpec.describe "weeks/show", type: :view do
  before(:each) do
    @week = assign(:week, Week.create!(
      :from => '12/1/2016',
      :to => '12/7/2016',
      :month => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match('2016-01-12')
    expect(rendered).to match('2016-01-12')
    expect(rendered).to match(//)
  end
end
