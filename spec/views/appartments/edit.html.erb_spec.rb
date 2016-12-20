require 'rails_helper'

RSpec.describe "appartments/edit", type: :view do
  let!(:chalet) { create :house }
  before(:each) do
    @appartment = assign(:appartment, Appartment.create!(
      :name => "MyString",
      :house => chalet
    ))
  end

  it "renders the edit appartment form" do
    render

    assert_select "form[action=?][method=?]", appartment_path(@appartment), "post" do

      assert_select "input#appartment_name[name=?]", "appartment[name]"


    end
  end
end
