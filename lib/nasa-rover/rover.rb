class Rover

  DIRECTIONS = ['N', 'E', 'S', 'W']
  DSIZE = 4

  attr_accessor :x, :y, :face
  
  def initialize(x, y, face)
    @x, @y, @face = x.to_i, y.to_i, face
    @software = XSoft.new(self)
  end  

  # full rover position with its turn
  def position
    [x, y, face]
  end

  def receive_signal(signal)
    @software.interpret(signal)
    return self
  end

end
