require 'rails_helper'

RSpec.describe "houses/index", type: :view do
  before(:each) do
    assign(:houses, [
      House.create!(
        :name => "Name",
        image_file_name:  'image.jpg',
        image_file_size:  1024,
        image_content_type:  'image/jpeg'
      ),
      House.create!(
        :name => "Name",
        image_file_name:  'image2.jpg',
        image_file_size:  1024,
        image_content_type:  'image/jpeg'
      )
    ])
  end

  it "renders a list of houses" do
    render
    assert_select "h2", :text => "Manage Name".to_s, :count => 2
  end
end
