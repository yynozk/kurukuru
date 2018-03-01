require 'dxopal'
include DXOpal

require_remote 'lib/player.rb'
require_remote 'lib/map_tile.rb'
require_remote 'lib/map.rb'

Window.load_resources do
  player = Player.new
  map = Map.create

  Window.loop do
    Sprite.update([player])
    Sprite.check([player], map.tiles)
    map.scroll(player.offset)
    Sprite.update(map.tiles)
    Sprite.draw([player] + map.tiles)

    if Input.key_push?(K_ESCAPE)
      player = Player.new
      map = Map.create
    end
  end
end
