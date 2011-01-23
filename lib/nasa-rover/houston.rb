class Houston

  attr_reader :planet

  def initialize(input)
    @orders = OrdersReader.new(input)

    # read planet's dimensions
    x, y = @orders.get_planet
    @planet = Planet.new(x.to_i, y.to_i)

    # rovers on the mission
    @rovers = []

    # report of the mission
    @report = ""
  end

  def start_the_mission!
    until @orders.eof? do
      x, y, face, signals = @orders.next_rover_data
      @rovers << rover = Rover.new(x, y, face)

      if out_of_planet?(rover)
        mission_failed(rover, "it missed the planet")
        next 
      end

      signals.each do |signal|
        rover.receive_signal(signal)
        if out_of_planet?(rover)
          mission_failed(rover, "it fell of the planet")
          break
        end
      end        
    end
  end

  def mission_report
    @rovers.each {|rover| @report << rover.position.join(' ') << "\n"} if @report.empty?
    return @report
  end

  private

  def out_of_planet?(rover)
    (rover.x > @planet.x || rover.x < 0 ||
     rover.y > @planet.y || rover.y < 0)
  end

  def mission_failed(rover, reason)
    @report += "Mission of Rover-#{@rovers.index(rover)} failed: #{reason}"
  end

end
