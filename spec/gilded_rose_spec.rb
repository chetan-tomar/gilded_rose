require_relative '../lib/gilded_rose'

describe "#update_quality" do

  context "with a single item" do
    let(:initial_sell_in) { 5 }
    let(:initial_quality) { 10 }
    let(:name) { "item" }
    let(:item) { Item.new(name, initial_sell_in, initial_quality) }

    before { update_quality([item]) }

    context 'item is "NORMAL ITEM"' do
      let(:name) { "NORMAL ITEM" }

      context 'when quality is 0' do
        let(:initial_quality) { 0 }

        context 'sell date not passed' do
          it 'does not decrease the quality' do
            expect(item.quality).to eq 0
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'quality does not decrease to be negative' do
            expect(item.quality).to eq 0
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq -2
          end
        end
      end

      context 'when quality is or less than 50' do
        context 'sell date not passed' do

          it 'decreases the quality by 1' do
            expect(item.quality).to eq 9
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'decreases the quality by 2' do
            expect(item.quality).to eq 8
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end

      end

      context 'when quality is more than 50' do
        let(:initial_quality) { 55 }

        context 'sell date not passed' do
          it 'decreases the quality by 1' do
            expect(item.quality).to eq 54
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'decreases the quality by 2' do
            expect(item.quality).to eq 53
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end
      end
    end

    context 'item is "Aged Brie"' do
      let(:name) { "Aged Brie" }

      context 'when quality is 0' do
        let(:initial_quality) { 0 }

        context 'sell date not passed' do
          it 'increases the quality by 1' do
            expect(item.quality).to eq 1
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'increases the quality by 2' do
            expect(item.quality).to eq 2
          end
          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end
      end

      context 'when quality is or less than 50' do
        context 'sell date not passed' do
          it 'increases the quality by 1' do
            expect(item.quality).to eq 11
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'increases the quality by 2' do
            expect(item.quality).to eq 12
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end

      end

      context 'when quality is 50' do
        let(:initial_quality) { 50 }

        context 'sell date not passed' do
          it 'does not increase the quality' do
            expect(item.quality).to eq 50
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'does not increase the quality' do
            expect(item.quality).to eq 50
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end
      end

      context 'when quality is more than 50' do
        let(:initial_quality) { 55 }

        context 'sell date not passed' do
          # it 'decreases quality to 50' do
          #   expect(item.quality).to eq 50
          # end
          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }
          # it 'decreases the quality to 50' do
          #   expect(item.quality).to eq 50
          # end
          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end
      end
    end

    context 'item is "Backstage"' do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }

      context 'when quality is or less than 50' do
        context 'sell days are more than 10' do
          let(:initial_sell_in) { 15 }

          it 'increases the quality by 1' do
            expect(item.quality).to eq 11
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 14
          end
        end

        context 'sell days are more than 5 less than 10' do
          let(:initial_sell_in) { 6 }

          it 'increases the quality by 2' do
            expect(item.quality).to eq 12
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 5
          end
        end

        context 'sell days are 5 or less' do
          let(:initial_sell_in) { 5 }

          it 'increases the quality by 3' do
            expect(item.quality).to eq 13
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

      end

      context 'when quality is more than 50' do
        let(:initial_quality) { 55 }

        context 'sell date not passed' do
          it 'does not update quality' do
            expect(item.quality).to eq 55
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq 4
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'descreases the quality to 0' do
            expect(item.quality).to eq 0
          end

          it 'decreases sell in days by 1' do
            expect(item.sell_in).to eq(-2)
          end
        end
      end
    end

    context 'item is "Sulfuras, Hand of Ragnaros"' do
      let(:name) { "Sulfuras, Hand of Ragnaros" }

      context 'when quality is 0' do
        let(:initial_quality) { 0 }

        context 'sell date not passed' do
          it 'does not update the quality' do
            expect(item.quality).to eq 0
          end

          it 'does not update sell in days' do
            expect(item.sell_in).to eq 5
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'does not update the quality' do
            expect(item.quality).to eq 0
          end

          it 'does not update sell in days' do
            expect(item.sell_in).to eq(-1)
          end
        end
      end

      context 'when quality is or less than 80' do
        let(:initial_quality) { 80 }

        context 'sell date not passed' do
          it 'does not update the quality' do
            expect(item.quality).to eq 80
          end

          it 'does not update sell in days' do
            expect(item.sell_in).to eq 5
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }

          it 'does not update the quality' do
            expect(item.quality).to eq 80
          end

          it 'does not update sell in days' do
            expect(item.sell_in).to eq(-1)
          end
        end

      end

      context 'when quality is more than 80' do
        let(:initial_quality) { 81 }

        context 'sell date not passed' do
          it 'does not update the quality' do
            expect(item.quality).to eq 81
          end

          it 'does not update the sell in days' do
            expect(item.sell_in).to eq 5
          end
        end

        context 'sell date passed' do
          let(:initial_sell_in) { -1 }
          it 'does not update the quality' do
            expect(item.quality).to eq 81
          end

          it 'does not update sell in days' do
            expect(item.sell_in).to eq(-1)
          end
        end

      end
    end

  end

  context "with multiple items" do
    let(:items) {
      [
        Item.new("NORMAL ITEM", 5, 10),
        Item.new("Aged Brie", 3, 10),
      ]
    }

    before { update_quality(items) }

    it 'degrades the quality of normal item' do
      expect(items[0].quality).to eq 9
    end

    it 'degrades the sell in days for normal item' do
      expect(items[0].sell_in).to eq 4
    end

    it 'increases the quality of Aged Brie' do
      expect(items[1].quality).to eq 11
    end

    it 'degrades the sell in days of Aged Brie' do
      expect(items[1].sell_in).to eq 2
    end
  end
end
