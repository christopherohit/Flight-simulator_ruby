require 'gosu'
require './lib/player_ship'
require './lib/z_order'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new "media/space.png", tileable: true

    @player_ship = PlayerShip.new self, 320, 240
  end

  def update
    if Gosu::button_down? Gosu::KbLeft
      @player_ship.turn_left
      @player_ship.accelerate
    end
    if Gosu::button_down? Gosu::KbRight
      @player_ship.turn_right
      @player_ship.accelerate
    end
    if Gosu::button_down? Gosu::KbUp
      @player_ship.turn_up
      @player_ship.accelerate
    end

    if Gosu::button_down? Gosu::KbDown
      @player_ship.turn_down
      @player_ship.accelerate
    end
    @player_ship.move
  end

  def draw
    @background_image.draw 0, 0, ZOrder::BACKGROUND
    @player_ship.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = GameWindow.new
window.show
