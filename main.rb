require 'dxopal'
include DXOpal

require_remote 'lib/player.rb'
require_remote 'lib/map_tile.rb'
require_remote 'lib/map.rb'

Window.load_resources do
  player = [Player.new]
  map = Map.create

  Window.loop do
    Sprite.update(player + map)
    Sprite.check(player, map)
    Sprite.draw(player + map)
  end
end
