require_relative '../lib/gilded_rose'
require_relative '../lib/base_component'
require_relative '../lib/conjured'

describe "Conjured" do
  let(:inital_sell_in) { 5 }
  let(:initial_quality) { 10 }
  let(:name) { 'Conjured' }
  let(:item) { Item.new(name, inital_sell_in, initial_quality) }


  context 'sell_in update' do
    before { Conjured.new(item).update_sell_in }
    context 'when on day' do
      it 'decreases the sell_in' do
        expect(item.sell_in).to eq 4
      end
    end

    context 'when last day' do
      let(:inital_sell_in) { 1 }
      it 'decreases the sell_in' do
        expect(item.sell_in).to eq 0
      end
    end

    context 'when day passed' do
      let(:inital_sell_in) { -1 }
      it 'decreases the sell_in' do
        expect(item.sell_in).to eq(-2)
      end
    end
  end

  context 'quality update' do
    before { Conjured.new(item).update_quality }

    context 'when quality is not min' do
      it 'descreases the quality by 2' do
        expect(item.quality).to eq 8
      end
    end

    context 'when quality is near to min' do
      let(:initial_quality) { 1 }
      it 'descreases the quality' do
        expect(item.quality).to eq 0
      end
    end

    context 'when quality is min' do
      let(:initial_quality) { 0 }
      it 'returns minimum quality' do
        expect(item.quality).to eq 0
      end
    end
  end
end
