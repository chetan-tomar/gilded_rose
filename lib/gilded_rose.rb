require 'goods_factory'

# Created a Singleton class GildedRose becacuse we don't need to create instances of this class
# so making it simple to invoke update_items and update_single_item class methods.

class GildedRose
  class << self
    def update_items(items = [])
      items.each do |item|
        update_single_item(item)
      end
    end

    def update_single_item(item)
      smart_item = GoodsFactory.smart_item(item)
      smart_item.update_quality
      smart_item.update_sell_in
    end
  end
end
######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
