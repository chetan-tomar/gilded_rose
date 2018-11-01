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
      klass = component_klass[item.name] || BaseComponent
      klass_object = klass.new(item)
      klass_object.update_quality
      klass_object.update_sell_in
    end

    def component_klass
      { 'Aged Brie' => AgedBrie,
        'Backstage passes to a TAFKAL80ETC concert' => BackstagePasses,
        'Sulfuras, Hand of Ragnaros' => Sulfuras,
        'Conjured' => Conjured
      }
    end
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
