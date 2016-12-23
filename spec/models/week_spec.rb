require 'rails_helper'

RSpec.describe Week, type: :model do

  it { should validate_presence_of(:from) }
  it { should validate_presence_of(:to) }

  it { should have_many(:pricings).dependent(:destroy) }

  it { should belong_to(:month) }
end
