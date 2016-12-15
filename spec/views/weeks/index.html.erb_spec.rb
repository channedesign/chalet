require 'rails_helper'

RSpec.describe "weeks/index", type: :view do
  before(:each) do
    assign(:weeks, [
      Week.create!(
        :from => 2,
        :to => 3,
        :month => nil
      ),
      Week.create!(
        :from => 2,
        :to => 3,
        :month => nil
      )
    ])
  end

  it "renders a list of weeks" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
