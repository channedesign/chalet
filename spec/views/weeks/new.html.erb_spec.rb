require 'rails_helper'

RSpec.describe "weeks/new", type: :view do
  before(:each) do
    assign(:week, Week.new(
      :from => 1,
      :to => 1,
      :month => nil
    ))
  end

  it "renders new week form" do
    render

    assert_select "form[action=?][method=?]", weeks_path, "post" do

      assert_select "input#week_from[name=?]", "week[from]"

      assert_select "input#week_to[name=?]", "week[to]"

      assert_select "input#week_month_id[name=?]", "week[month_id]"
    end
  end
end
