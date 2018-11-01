require_relative '../lib/gilded_rose'
require_relative '../lib/base_component'
require_relative '../lib/aged_brie'

describe 'AgedBrie' do

  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }

  let(:item) { Item.new('Aged Brie', initial_sell_in, initial_quality) }

  context 'when sell_in' do
    before { AgedBrie.new(item).update_sell_in }

    context 'is on day' do
      it 'decreases sell_in' do
        expect(item.sell_in).to eq 4
      end
    end

    context 'date passed' do
      let(:initial_sell_in) { -1 }

      it 'updates sell_in' do
        expect(item.sell_in).to eq(-2)
      end
    end  
  end

  context 'when quality' do
    before { AgedBrie.new(item).update_quality }

    context 'is less than 50' do
      it 'increases the quality' do
        expect(item.quality).to eq 11
      end
    end

    context 'is near to 50' do
      let(:initial_quality) { 49 }

      it 'increases the quality' do
        expect(item.quality).to eq 50
      end
    end

    context 'is 50' do
      let(:initial_quality) { 50 }

      it 'does not increase the quality' do
        expect(item.quality).to eq 50
      end
    end
  end
end
