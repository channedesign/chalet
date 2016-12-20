require 'rails_helper'

RSpec.describe Appartment, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_length_of(:name).is_at_least(1).is_at_most(50) }

  it { should validate_uniqueness_of(:name) }

  it { should have_many(:months).dependent(:destroy) }

  it { should belong_to(:house) }
end
