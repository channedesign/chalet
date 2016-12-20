require 'rails_helper'

RSpec.describe Pricing, type: :model do

  it { should validate_presence_of(:self_catered) }

  it { should validate_presence_of(:weekend) }

  it { should belong_to(:week) }
end
