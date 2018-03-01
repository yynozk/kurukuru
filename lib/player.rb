class Player < Sprite
  LEFT_LIMIT, RIGHT_LIMIT = 260, 380
  UP_LIMIT, DOWN_LIMIT = 200, 280

  WIDTH, HEIGHT = 180, 24
  SPEED_MOVE = 5
  SPEED_BOUND = 9
  SPEED_ROTATION = 1
  SPEED_BOUND_ROTATION = 2
  COLOR_ALIVE = C_WHITE
  COLOR_DEAD = [96, 96, 96]
  COLOR_GOAL = C_YELLOW

  def initialize(x = 320, y = 240)
    super()
    self.image = Image.new(WIDTH, HEIGHT, COLOR_ALIVE)

    @_x, @_y, @_a = x - WIDTH/2, y - HEIGHT/2, 0
    @va = 1
    @offset = {x: 0, y: 0}
    @alive = true
  end

  def update
    return unless @alive

    @_x += Input.x * SPEED_MOVE
    @_y += Input.y * SPEED_MOVE
    @_a += SPEED_ROTATION * @va

    move
  end

  def shot(other)
    case other.role
    when :wall, :moving_wall
      @alive = false
      self.image = Image.new(WIDTH, HEIGHT, COLOR_DEAD)
    when :spring
      @_x -= Input.x * SPEED_BOUND
      @_y -= Input.y * SPEED_BOUND
      @va *= -1
      @_a += SPEED_BOUND_ROTATION * @va
    when :goal
      @alive = false
      self.image = Image.new(WIDTH, HEIGHT, COLOR_GOAL)
    end

    move
  end

  def update_offset
    @offset = {
      x: @_x - Window.width/2 + self.image.width/2,
      y: @_y - Window.height/2 + self.image.height/2
    }
    move

    @offset
  end


  private

  def move
    self.x = @_x - @offset[:x]
    self.y = @_y - @offset[:y]
    self.angle = @_a
  end
end
