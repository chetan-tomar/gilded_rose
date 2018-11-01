require 'base_component'

# README.md => `Aged Brie` actually increases in `quality` the older it gets

class AgedBrie < BaseComponent

  # Override BaseComponent#update_quality method for different behaviour

  def update_quality
    increase_quality(item)  # increase quality by 1
  end
end
