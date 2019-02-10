# frozen_string_literal: true

class TRex
  include Square

  attr_accessor :x, :y

  INITIAL_X = Main::X * 0.1
  INITIAL_Y = Main::Y * 0.5
  IMG_X = 44
  IMG_Y = 47

  def initialize
    @x = INITIAL_X
    @y = INITIAL_Y
    @y_accel = 0
    @jumping = false
    build_tiles
  end

  def build_tiles
    @img_x = IMG_X
    @img_y = IMG_Y
    @tiles = Gosu::Image.load_tiles('media/t_rex_running.png', @img_x, @img_y)
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
    if @y_accel.negative?
      going_up
    elsif @y_accel.positive?
      going_down
    end
  end

  def going_up
    @y_accel *= 0.80 unless @y_accel.zero?
    @y_accel = 1 if @y_accel > -1
  end

  def going_down
    @y_accel *= 1.20
  end

  def draw
    @tiles[Gosu.milliseconds / 100 % @tiles.size].draw(@x, @y, 1)
  end
end
