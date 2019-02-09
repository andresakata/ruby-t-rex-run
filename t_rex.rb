# frozen_string_literal: true

class TRex
  INITIAL_X = Main::X * 0.1
  INITIAL_Y = Main::Y * 0.5

  def initialize
    @tiles = Gosu::Image.load_tiles('media/t_rex_running.png', 44, 47)
    @y = INITIAL_Y
    @y_accel = 0
    @jumping = false
  end

  def update
    jump if Gosu.button_down?(Gosu::KB_UP) && !@jumping
    update_y
    update_y_accel
  end

  def jump
    @jumping = true
    @y_accel = -18
  end

  def update_y
    @y += @y_accel
    return unless @y > INITIAL_Y
    @y = INITIAL_Y
    @y_accel = 0
    @jumping = false
  end

  def update_y_accel
    if @y_accel < 0
      going_up
    elsif @y_accel > 0
      going_down
    end
  end

  def going_up
    @y_accel *= 0.82 unless @y_accel == 0
    @y_accel = 1 if @y_accel > -1
  end

  def going_down
    @y_accel *= 1.18
  end

  def draw
    @tiles[Gosu.milliseconds / 100 % @tiles.size].draw(INITIAL_X, @y, 1)
  end
end
