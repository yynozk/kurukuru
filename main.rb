require 'dxopal'
include DXOpal

require_remote 'lib/player.rb'
require_remote 'lib/map_tile.rb'
require_remote 'lib/map.rb'

Window.load_resources do
  player, map = Map.create

  Window.loop do
    Sprite.update([player])
    Sprite.check([player], map.tiles)
    map.offset = player.update_offset
    Sprite.update(map.tiles)
    Sprite.draw(map.tiles + [player])

    if Input.key_push?(K_ESCAPE)
      player, map = Map.create
    end
  end
end
