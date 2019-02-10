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
    tree_square = @tree.square
    t_rex_square = @t_rex.square
    collision_point(t_rex_square[0], tree_square) ||
      collision_point(t_rex_square[1], tree_square)
  end

  def collision_point(point_a, square)
    square_point_a = square[0]
    square_point_b = square[1]
    (square_point_a[0]..square_point_b[0]).cover?(point_a[0]) &&
      (square_point_a[1]..square_point_b[1]).cover?(point_a[1])
  end

  def draw
    @t_rex.draw
    @tree.draw
  end
end
