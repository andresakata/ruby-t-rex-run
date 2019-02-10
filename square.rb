# frozen_string_literal: true

module Square
  def square
    [
      [@x, @y],
      [@x + @img_x, @y + @img_y]
    ]
  end
end
