class XSoft

  #
  # one of possible softwares for NASA rover
  # this one works with three signals: L, R or M
  # M - move forward; L - turn left; R - turn right
  #

  # allowed signals from Houston
  PROTOCOL = ['M', 'L', 'R']

  def initialize(rover)
    @rover = rover
  end

  # act properly to the received signal
  # makes the interpret method only API (public method) to a rover
  def interpret(signal)
    raise "signal not supported: #{signal}" unless PROTOCOL.include?(signal)

    case signal
    when 'M' then move
    when 'L', 'R' then turn(signal)
    end
  end

  private

  # depending if signal is left or right
  # set previous or next direction as a new one
  def turn(direction)
    turn_value = (direction == "L") ? -1 : 1
    new_face_index = (Rover::DIRECTIONS.index(@rover.face)+turn_value) % Rover::DSIZE
    set_face(Rover::DIRECTIONS[new_face_index])
  end

  # move left, right, forward or backwards depending on rover's face
  def move
    x, y = @rover.x, @rover.y

    new_location = case @rover.face
                   when 'N' then [x, y+1]
                   when 'E' then [x+1, y]
                   when 'S' then [x, y-1]
                   when 'W' then [x-1, y]
                   else raise 'no turn'
    end

    set_location(new_location)
    return self
  end

  # changes the information about the position of a rover
  def set_location(new_coordinates)
    @rover.x, @rover.y = new_coordinates
  end

  # changes the information about the turn of a rover
  def set_face(direction)
    @rover.face = direction
  end
end
