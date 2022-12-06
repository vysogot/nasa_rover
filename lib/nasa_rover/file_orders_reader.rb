class FileOrdersReader

  #
  # interprets the NASA orders from a file
  #

  def initialize(orders)
    @orders = File.new(orders, 'r')
    @planet = nil
  end

  # retrieves the planet information
  def get_planet
    return @planet ||= @orders.readline.split(' ')
  end

  # retrives position and list of signals for next rover
  def next_rover_data
    unless self.eof?
      x, y, face = @orders.readline.split(' ') 
      signals = @orders.readline.chomp.split('')
      return [x, y, face, signals]
    end
  end

  # checks if there are no more orders
  def eof?
    @orders.eof?
  end
end


