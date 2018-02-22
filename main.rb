require 'dxopal'
include DXOpal

require_remote 'lib/player.rb'
require_remote 'lib/map_tile.rb'
require_remote 'lib/map.rb'

Window.load_resources do
  objects = [Player.new, Map.create].flatten

  Window.loop do
    Sprite.update(objects)
    Sprite.draw(objects)
  end
end
