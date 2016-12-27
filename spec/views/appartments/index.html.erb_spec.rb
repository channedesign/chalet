require 'rails_helper'

RSpec.describe "appartments/index", type: :view do
  let!(:chalet) { create :house }
  before(:each) do
    assign(:appartments, [
      Appartment.create!(
        :name => "Name",
        :house => chalet
      ),
      Appartment.create!(
        :name => "Name2",
        :house => chalet
      )
    ])
  end

  it "renders a list of appartments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => chalet.name.to_s, :count => 2
  end
end
