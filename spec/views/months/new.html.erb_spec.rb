require 'rails_helper'

RSpec.describe "months/new", type: :view do
  before(:each) do
    assign(:month, Month.new(
      :name => "MyString",
      :appartment => nil
    ))
  end

  it "renders new month form" do
    render

    assert_select "form[action=?][method=?]", months_path, "post" do

      assert_select "input#month_name[name=?]", "month[name]"

      assert_select "input#month_appartment_id[name=?]", "month[appartment_id]"
    end
  end
end
