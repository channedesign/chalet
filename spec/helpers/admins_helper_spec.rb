require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AdminsHelper. For example:
#
# describe AdminsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AdminsHelper, type: :helper do
  describe '#active_tab?' do
    context 'i == 0' do
      it 'is active' do
        i = 0
        expect(active_tab?(i)).to eq('active')
      end
    end

    context 'i != 0' do
      it 'is not active' do
        i = 1
        expect(active_tab?(i)).to eq(nil)
      end
    end
  end

  describe '#column' do
    it 'calculates the number of columns' do
      num1 = 1
      num2 = 2
      num3 = 3

      expect(column(num1)).to eq(12)
      expect(column(num2)).to eq(6)
      expect(column(num3)).to eq(4)
    end
  end

end
