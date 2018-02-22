require 'dxopal'
include DXOpal

require_remote 'lib/player.rb'

Window.load_resources do
  objects = [Player.new]

  Window.loop do
    Sprite.update(objects)
    Sprite.draw(objects)
  end
end
