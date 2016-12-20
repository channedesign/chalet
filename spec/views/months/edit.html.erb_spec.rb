require 'rails_helper'

RSpec.describe "months/edit", type: :view do
  let!(:chalet) { create :house }
  let!(:panda) { create :appartment, house_id: chalet.id }
  before(:each) do
    @month = assign(:month, Month.create!(
      :name => "MyString",
      :appartment => panda
    ))
  end

  it "renders the edit month form" do
    render

    assert_select "form[action=?][method=?]", month_path(@month), "post" do

      assert_select "input#month_name[name=?]", "month[name]"

      assert_select "input#month_appartment_id[name=?]", "month[appartment_id]"
    end
  end
end
