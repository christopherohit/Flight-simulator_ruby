require "./lib/z_order"

class PlayerShip
  def initialize window, x = 0, y = 0
    @image = Gosu::Image.new("media/starfighter.bmp")
    @x = x.to_i
    @y = y.to_i
    @speed_x = @speed_y = @angle = 0.0
    @window = window
  end

  def turn_left
    @angle = -90
  end

  def turn_right
    @angle = 90
  end

  def turn_up
    @angle = 0
  end

  def turn_down
    @angle = 180
  end

  def accelerate
    @speed_x += Gosu::offset_x(@angle, 0.4)
    @speed_y += Gosu::offset_y(@angle, 0.4)
  end

  def move
    @x += @speed_x
    @y += @speed_y
    padding = 16
    @x = [@window.width - padding, @x].min
    @y = [@window.height - padding, @y].min
    @x = [padding, @x].max
    @y = [padding, @y].max

    @speed_x *= 0.96
    @speed_y *= 0.96
  end

  def draw
    @image.draw_rot(@x, @y, ZOrder::PLAYER, @angle, 0.5, 0.5, 0.7, 0.7)
  end
end
