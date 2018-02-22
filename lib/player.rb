class Player < Sprite
  @@image = Image.new(10, 50, C_WHITE)

  def initialize
    super
    self.x, self.y = 50, 60
    self.image = @@image
  end

  def update
    self.angle += 1
    self.x += Input.x
    self.y += Input.y
  end
end
