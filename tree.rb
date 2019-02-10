# frozen_string_literal: true

class Tree
  include Square

  attr_accessor :x, :y

  IMG_Y = 48
  IMG_X = 25
  INITIAL_Y = TRex::INITIAL_Y + TRex::IMG_Y - IMG_Y

  def initialize
    @img_x = IMG_X
    @img_y = IMG_Y
    @x = Main::X
    @y = INITIAL_Y
    @image = Gosu::Image.new('media/tree.png')
  end

  def update
    @x = Main::X if @x < 0
    @x -= 10
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
