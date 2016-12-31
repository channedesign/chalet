require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should validate_presence_of(:house_id) }
  it { should belong_to(:house) }
  it { should validate_attachment_content_type(:chalet_picture).
                allowing('image/png', 'image/gif', 'image/jpg').
                rejecting('text/plain', 'text/xml') }

  it { should validate_attachment_presence(:chalet_picture) }

  it { should validate_attachment_size(:chalet_picture).less_than(1.megabyte) }
end
