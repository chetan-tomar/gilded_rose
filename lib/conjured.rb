class Conjured < BaseComponent

  # Override BaseComponent#update_quality method for different behaviour.

  def update_quality
    # `Conjured` items degrade in `quality` twice as fast as normal items
    degrades_quality(item, 2)
  end
end