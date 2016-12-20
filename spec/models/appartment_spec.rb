require 'rails_helper'

RSpec.describe Appartment, type: :model do
  it { should validate_presence_of(:name) }

  it { should have_many(:months).dependent(:destroy) }

  it { should belong_to(:house) }
end
