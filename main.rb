# frozen_string_literal: true

class Main < Gosu::Window
  X = 640
  Y = 480

  def initialize
    super X, Y
    self.caption = 'T-Rex Run'
    @t_rex = TRex.new
    @tree = Tree.new
  end

  def update
    return if collision?
    @t_rex.update
    @tree.update
  end

  def collision?
    collision_point(@t_rex.square[0], @tree.square) ||
      collision_point(@t_rex.square[1], @tree.square)
  end

  def collision_point(point_a, square)
    (square[0][0]..square[1][0]).cover?(point_a[0]) &&
      (square[0][1]..square[1][1]).cover?(point_a[1])
  end

  def draw
    @t_rex.draw
    @tree.draw
  end
end
