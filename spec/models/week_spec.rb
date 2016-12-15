require 'rails_helper'

RSpec.describe Week, type: :model do
  it { should validate_numericality_of(:from) }
  it { should validate_numericality_of(:to) }
end
