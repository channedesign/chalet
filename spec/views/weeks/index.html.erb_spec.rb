require 'rails_helper'

RSpec.describe "weeks/index", type: :view do
  before(:each) do
    assign(:weeks, [
      Week.create!(
        :from => '12/1/2016',
        :to => '12/7/2016',
        :month => nil
      ),
      Week.create!(
        :from => '12/1/2016',
        :to => '12/7/2016',
        :month => nil
      )
    ])
  end

  it "renders a list of weeks" do
    render
    assert_select "tr>td", :text => '2016-01-12', :count => 2
    assert_select "tr>td", :text => '2016-07-12', :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
