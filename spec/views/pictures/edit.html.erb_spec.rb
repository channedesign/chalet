require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  let(:chalet) { create :house }
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :name => "MyString",
      :house => chalet,
      :position => 1,
      chalet_picture_file_name:  'image.jpg',
      chalet_picture_file_size:  512,
      chalet_picture_content_type:  'image/jpeg'
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input#picture_name[name=?]", "picture[name]"

      assert_select "input#picture_house_id[name=?]", "picture[house_id]"

      
    end
  end
end
