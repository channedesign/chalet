require 'rails_helper'

RSpec.describe "pictures/show", type: :view do
  let(:chalet) { create :house }
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :name => "Name",
      :house => chalet,
      :position => 2,
      chalet_picture_file_name:  'image.jpg',
      chalet_picture_file_size:  512,
      chalet_picture_content_type:  'image/jpeg'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
