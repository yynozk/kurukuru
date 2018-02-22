class MapTile < Sprite
  def self.init(tileset, xcount, ycount)
    @@tileset = tileset.slice_tiles(xcount, ycount)
    @@tile_width = @@tileset[0].width
    @@tile_height = @@tileset[0].height
  end

  def initialize(x, y, tile_index)
    super()
    self.x, self.y = x * @@tile_width, y * @@tile_height
    self.image = @@tileset[tile_index]
  end
end
