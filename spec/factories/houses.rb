include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :house do
    name "Chalet 1"
    # image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/images/image.jpg") }
    # image_file_name { 'image.jpg' }
    # image_file_size { 1024 }
    # image_content_type { 'image/jpeg' }
     image { fixture_file_upload( File.join(Rails.root, 'spec', 'support', 'images', 'image.jpg'), 'image/jpeg') }
  end
end
