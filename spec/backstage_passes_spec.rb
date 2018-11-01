require_relative '../lib/gilded_rose'
require_relative '../lib/base_component'
require_relative '../lib/backstage_passes'

describe 'BackstagePasses' do
  let(:initial_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }
  let(:item) { Item.new(name, initial_sell_in, initial_quality) }

  context 'sell_in update' do
    before { BackstagePasses.new(item).update_sell_in }
    context 'when on day' do
      it 'decreases the sell_in' do
        expect(item.sell_in).to eq 4
      end
    end

    context 'when last day' do
      let(:initial_sell_in) { 1 }
      it 'decreases the sell_in' do
        expect(item.sell_in).to eq 0
      end
    end

    context 'when day passed' do
      let(:initial_sell_in) { -1 }
      it 'decreases the sell_in' do
        expect(item.sell_in).to eq(-2)
      end
    end
  end

  context 'quality update' do
    before { BackstagePasses.new(item).update_quality }

    context 'when there are 5 days or less' do
      it 'increases the quality by 3' do
        expect(item.quality).to eq 13
      end
    end

    context 'when there are 10 days or less' do
      let(:initial_sell_in) { 7 }
      it 'increases the quality by 2' do
        expect(item.quality).to eq 12
      end
    end

    context 'when there are more than 10 days' do
      let(:initial_sell_in) { 15 }
      it 'increases the quality by 1' do
        expect(item.quality).to eq 11
      end
    end
  end
end
