require 'require_all'

class BaseComponent

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_quality
    degrades_quality
  end

  def update_sell_in
    degrades_sell_in
  end

  private

  # clarification, an item can never have its `quality` increase
  # above 50, however `Sulfuras` is a legendary item and as such its
  # `quality` is 80 and it never alters.

  def degrades_quality(number = 1)
    number = update_by_number(item.sell_in, number)
    item.quality -= number
    item.quality = MIN_QUALITY if item.quality < MIN_QUALITY
  end

  def increase_quality(item, number = 1)
    # README.md => The `quality` of an item is never more than 50
    number = update_by_number(item.sell_in, number)
    item.quality += number
    item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
  end

  def degrades_sell_in(number = 1)
    item.sell_in -= number
  end

  def update_by_number(sell_in_days, number)
    # README.md => - Once the sell by date has passed, `quality` degrades twice as fast
    sell_in_days.negative? ? number * 2 : number
  end

end
