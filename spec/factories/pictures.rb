FactoryGirl.define do
  factory :picture do
    name "MyString"
    house
    position 1
    chalet_picture { fixture_file_upload( "#{Rails.root}/spec/support/images/image.jpg", 'image/jpeg') }
  end
end
