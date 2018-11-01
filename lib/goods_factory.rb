require 'aged_brie'
require 'backstage_passes'
require 'sulfuras'
require 'conjured'
require 'base_component'

class GoodsFactory
  ITEM_MAPPING = {
      'Aged Brie' => AgedBrie,
      'Backstage passes to a TAFKAL80ETC concert' => BackstagePasses,
      'Sulfuras, Hand of Ragnaros' => Sulfuras,
      'Conjured' => Conjured
  }

  def self.smart_item(item)
    klass = ITEM_MAPPING[item.name] || BaseComponent
    klass.new(item)
  end
end
