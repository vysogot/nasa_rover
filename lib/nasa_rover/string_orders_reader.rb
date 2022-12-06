class StringOrdersReader

  #
  # interprets the NASA orders from a string
  #

  def initialize(orders)
    @orders = orders.split("\n")
    @planet, @line_number = nil, 1
  end

  # first row in a string is for the planet
  def get_planet
    return @planet ||= @orders[0].split(' ')
  end

  # next rows couples are for position and list of signals for a rover
  def next_rover_data
    unless self.eof?
      x, y, face = @orders[@line_number].split(' ') 
      signals = @orders[@line_number+1].split('')
      @line_number += 2
      return [x, y, face, signals]
    end
  end

  # checks if it isn't out of bound
  def eof?
    @orders[@line_number].nil?
  end
end

