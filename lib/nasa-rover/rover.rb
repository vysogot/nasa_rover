class Rover

  #
  # represents the NASA rover, is the actuator and sensor
  # controlled by its software - in this case XSoft
  #

  # possible directions for 90-degrees turning rover
  DIRECTIONS = ['N', 'E', 'S', 'W']
  DSIZE = 4

  attr_accessor :x, :y, :face
  
  def initialize(x, y, face)
    @x, @y, @face = x.to_i, y.to_i, face

    # can be any software... easy to convert is to play chess
    @software = XSoft.new(self)
  end  

  # full rover position with its turn
  def position
    [x, y, face]
  end

  # when a signal is received behaves like proxy to its software
  def receive_signal(signal)
    @software.interpret(signal)
    return self
  end

end
