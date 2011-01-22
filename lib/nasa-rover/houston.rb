class Houston

  attr_reader :planet

  def initialize(input_file)
    @orders = File.new(input_file, 'r')

    # read planet's dimensions
    x, y = @orders.readline.split(' ') 
    @planet = Planet.new(x, y)

    # rovers on the mission
    @rovers = []
  end

  def start_the_mission!
    until @orders.eof? do
      x, y, face = @orders.readline.split(' ') 
      signals = @orders.readline.chomp.split('')
      
      rover = Rover.new(x, y, face)
      @rovers << rover

      signals.each { |signal| rover.receive_signal(signal) }
    end
  end

  def mission_report
    report = ""
    @rovers.each {|rover| report << rover.position.join(' ') << "\n"}
    return report
  end

end
