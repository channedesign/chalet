require 'rails_helper'

RSpec.describe "appartments/new", type: :view do
  before(:each) do
    assign(:appartment, Appartment.new(
      :name => "MyString",
      :house => nil
    ))
  end

  it "renders new appartment form" do
    render

    assert_select "form[action=?][method=?]", appartments_path, "post" do

      assert_select "input#appartment_name[name=?]", "appartment[name]"

      
    end
  end
end
