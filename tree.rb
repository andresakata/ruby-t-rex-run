# frozen_string_literal: true

class Tree
  IMG_Y = 48
  INITIAL_Y = TRex::INITIAL_Y + TRex::IMG_Y - IMG_Y

  def initialize
    @image = Gosu::Image.new('media/tree.png')
    @x = Main::X
  end

  def update
    @x = Main::X if @x < 0
    @x -= 10
  end

  def draw
    @image.draw(@x, INITIAL_Y, 1)
  end
end
