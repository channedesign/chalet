require 'rails_helper'

RSpec.describe "appartments/index", type: :view do
  before(:each) do
    assign(:appartments, [
      Appartment.create!(
        :name => "Name",
        :house => nil
      ),
      Appartment.create!(
        :name => "Name2",
        :house => nil
      )
    ])
  end

  it "renders a list of appartments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
