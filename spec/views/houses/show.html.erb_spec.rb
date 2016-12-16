require 'rails_helper'

RSpec.describe "houses/show", type: :view do
  before(:each) do
    @house = assign(:house, House.create!(
      :name => "Name",
      image_file_name:  'image.jpg',
      image_file_size:  1024,
      image_content_type:  'image/jpeg'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
