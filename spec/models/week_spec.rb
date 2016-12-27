require 'rails_helper'

RSpec.describe Week, type: :model do

  it { should validate_presence_of(:from) }
  it { should validate_presence_of(:to) }
  it { should validate_presence_of(:self_catered) }

  it { should validate_presence_of(:weekend) }

  

  it { should belong_to(:month) }
end
