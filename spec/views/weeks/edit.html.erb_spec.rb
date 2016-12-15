require 'rails_helper'

RSpec.describe "weeks/edit", type: :view do
  before(:each) do
    @week = assign(:week, Week.create!(
      :from => 1,
      :to => 1,
      :month => nil
    ))
  end

  it "renders the edit week form" do
    render

    assert_select "form[action=?][method=?]", week_path(@week), "post" do

      assert_select "input#week_from[name=?]", "week[from]"

      assert_select "input#week_to[name=?]", "week[to]"

      assert_select "input#week_month_id[name=?]", "week[month_id]"
    end
  end
end
