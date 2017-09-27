require 'rails_helper'

RSpec.describe "floor_plans/new", type: :view do
  before(:each) do
    assign(:floor_plan, FloorPlan.new(
      :house => nil
    ))
  end

  it "renders new floor_plan form" do
    render

    assert_select "form[action=?][method=?]", floor_plans_path, "post" do

      assert_select "input#floor_plan_house_id[name=?]", "floor_plan[house_id]"
    end
  end
end
