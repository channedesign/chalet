require 'rails_helper'

RSpec.describe "weeks/edit", type: :view do
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  let!(:december) { create :month, appartment_id: panda.id }
  before(:each) do
    @week = assign(:week, Week.create!(
      :from => '12/1/2016',
      :to => '12/7/2016',
      :month => december
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
