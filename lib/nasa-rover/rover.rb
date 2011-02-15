class Rover

  #
  # represents the NASA rover, is the actuator and sensor
  # controlled by its software - in this case XSoft
  #

  # to be observed by Planet
  include Observable

  # possible directions for 90-degrees turning rover
  DIRECTIONS = ['N', 'E', 'S', 'W']
  DSIZE = 4

  attr_accessor :x, :y, :face
  
  def initialize(planet, x, y, face) 
    @x, @y, @face = x.to_i, y.to_i, face

    # can be any software... easy to convert is to play chess
    @software = XSoft.new(self)

    # first planet notification
    self.add_observer(planet)
    changed; notify_observers(self)
  end  

  # full rover position with its turn
  def position
    [x, y, face]
  end

  # when a signal is received behaves like proxy to its software
  def receive_signal(signal)
    last_position = position
    @software.interpret(signal)
    if position != last_position
      changed; notify_observers(self)
    end
    return self
  end

end
