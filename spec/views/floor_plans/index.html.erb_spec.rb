require 'rails_helper'

RSpec.describe "floor_plans/index", type: :view do
  before(:each) do
    assign(:floor_plans, [
      FloorPlan.create!(
        :house => nil
      ),
      FloorPlan.create!(
        :house => nil
      )
    ])
  end

  it "renders a list of floor_plans" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
