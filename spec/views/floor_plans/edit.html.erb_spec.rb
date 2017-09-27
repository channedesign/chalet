require 'rails_helper'

RSpec.describe "floor_plans/edit", type: :view do
  before(:each) do
    @floor_plan = assign(:floor_plan, FloorPlan.create!(
      :house => nil
    ))
  end

  it "renders the edit floor_plan form" do
    render

    assert_select "form[action=?][method=?]", floor_plan_path(@floor_plan), "post" do

      assert_select "input#floor_plan_house_id[name=?]", "floor_plan[house_id]"
    end
  end
end
