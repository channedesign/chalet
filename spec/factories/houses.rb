include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :house do
    name "Chalet 1"
    # image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/images/image.jpg") }
    # image_file_name { 'image.jpg' }
    # image_file_size { 1024 }
    # image_content_type { 'image/jpeg' }
     image { fixture_file_upload( "#{Rails.root}/spec/support/images/image.jpg", 'image/jpeg') }


  end
end
#http://stackoverflow.com/questions/31650949/rails-4-paperclip-factorygirl-file-uploading for proper setup
