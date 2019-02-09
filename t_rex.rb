# frozen_string_literal: true

class TRex
  X = Main::X * 0.1
  Y = Main::Y * 0.5

  def initialize
    @tiles = Gosu::Image.load_tiles('media/t_rex_running.png', 44, 47)
  end

  def draw
    @tiles[Gosu.milliseconds / 100 % @tiles.size].draw(X, Y, 1)
  end
end
