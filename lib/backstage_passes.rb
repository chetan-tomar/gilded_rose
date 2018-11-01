# README.md
# `Backstage Passes`, like `Aged Brie`, increases in `quality` as its
#  `sell_in` value approaches; `quality` increases by 2 when there are 10
#  days or less and by 3 when there are 5 days or less but `quality`
#  drops to 0 after the concert

class BackstagePasses < BaseComponent

  # Override BaseComponent#update_quality method for different behaviour.

  def update_quality
    if item.quality <= MAX_QUALITY
      if item.sell_in <= 5                 # when there are 5 days or less
        increase_quality(item, 3)          # increases by 3
      elsif item.sell_in <= 10             # when there are 10 days or less
        increase_quality(item, 2)          # increases by 2
      else
        increase_quality(item)             # increase by 1
      end
    end
  end

  # Override BaseComponent#update_sell_in method for different behaviour.

  def update_sell_in
    degrades_sell_in                                      # degrades sell_in by 1
    item.quality = MIN_QUALITY if item.sell_in.negative?  # drops to 0 after the concert
  end
end
