# `Sulfuras` is a legendary item and as such its `quality` is 80 and it never alters.
# `Sulfuras`, being a legendary item, has no sell by date nor decreases in `quality`
class Sulfuras < BaseComponent

  MAX_QUALITY = 80

  def update_quality
    MAX_QUALITY
  end

  def update_sell_in
  end
end