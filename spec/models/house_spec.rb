require 'rails_helper'

RSpec.describe House, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_length_of(:name).is_at_least(1).is_at_most(50) }

  it { should validate_uniqueness_of(:name) }

  it { should have_many(:appartments).dependent(:destroy) }

  it { should have_attached_file(:image) }

  it { should validate_attachment_presence(:image) }

  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpg').
                rejecting('text/plain', 'text/xml') }

  it { should validate_attachment_size(:image).less_than(5.megabytes) }
end
