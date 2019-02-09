# frozen_string_literal: true

class Main < Gosu::Window
  X = 640
  Y = 480

  def initialize
    super X, Y
    self.caption = 'T-Rex Run'
    @t_rex = TRex.new
  end

  def draw
    @t_rex.draw
  end
end
