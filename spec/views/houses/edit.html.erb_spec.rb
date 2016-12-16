require 'rails_helper'
include ActionDispatch::TestProcess
RSpec.describe "houses/edit", type: :view do
  before(:each) do
    @house = assign(:house, House.create!(
      :name => "MyString",
      image_file_name:  'image.jpg',
      image_file_size:  1024,
      image_content_type:  'image/jpeg'
    ))
  end

  it "renders the edit house form" do
    render

    assert_select "form[action=?][method=?]", house_path(@house), "post" do

      assert_select "input#house_name[name=?]", "house[name]"
    end
  end
end
