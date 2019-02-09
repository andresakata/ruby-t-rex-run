# frozen_string_literal: true

require 'gosu'

class Main < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'T-Rex Run'
  end
end

Main.new.show
