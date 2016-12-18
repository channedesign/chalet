require 'rails_helper'

RSpec.describe "appartments/edit", type: :view do
  before(:each) do
    @appartment = assign(:appartment, Appartment.create!(
      :name => "MyString",
      :house => nil
    ))
  end

  it "renders the edit appartment form" do
    render

    assert_select "form[action=?][method=?]", appartment_path(@appartment), "post" do

      assert_select "input#appartment_name[name=?]", "appartment[name]"

    
    end
  end
end
