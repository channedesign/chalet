require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe '#pricing_format' do
    context 'has pricing' do
      it 'add € sign' do
        price = '1200'
        expect(pricing_format(price)).to eq("€1200")
      end
    end
    context 'has no pricing' do
      it 'does not add a € sign' do
        price = '-'
        expect(pricing_format(price)).to eq("-")
      end
    end
  end
end
