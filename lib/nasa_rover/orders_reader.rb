class OrdersReader

  #
  # adapter for interpreting NASA orders from different input types
  #

  def initialize(orders)
    @reader = if File.exist?(orders) then 
                FileOrdersReader.new(orders)
              else
                StringOrdersReader.new(orders)
              end
  end

  def get_planet
    @reader.get_planet
  end

  def next_rover_data
    @reader.next_rover_data
  end

  def eof?
    @reader.eof?
  end

end
