class Player < Sprite
  def initialize
    super
    self.x, self.y = 50, 60
    self.image = Image.new(10, 50, C_WHITE)
    @alive = true
  end

  def update
    return unless @alive
    self.angle += 1
    self.x += Input.x
    self.y += Input.y
  end

  def shot(other)
    @alive = false
    self.image = Image.new(10, 50, C_RED)
  end
end
