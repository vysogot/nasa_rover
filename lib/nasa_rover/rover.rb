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

  attr_accessor :x, :y, :face, :name

  def initialize(name = "UnnamedQuad")
    @name = name

    # can be any software... easy to convert is to play chess
    @software = XSoft.new(self)
  end

  # after creation, a rover is in the Houston factory
  # and then it has to be sent on the planet
  def send_on_planet(planet, x, y, face)
    @x, @y, @face = x.to_i, y.to_i, face

    # first planet notification
    self.add_observer(planet)
    changed; notify_observers(self)

    return self
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
