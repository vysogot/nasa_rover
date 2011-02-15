class Planet

  #
  # represents the planet Mars by its 
  # maximum two-dimension coordinates
  #

  # to be observed by Houston
  include Observable

  attr_reader :x, :y, :name

  def initialize(x, y)
    @x, @y, @name = x, y, "Mars"
    @virgin_plan = lambda { Array.new(@x) { Array.new(@y,nil) } }
    @rovers = []
  end

  # happens when rover changes position
  def update(rover)
    @rovers << rover unless known?(rover) 
  end

  # put each rover on a plan (maybe other objects in the future)
  def plan
    clean_plan = @virgin_plan.call
    @rovers.each do |rover|
      clean_plan[rover.y-1][rover.x-1] = rover
    end

    # reverse it so it left bottom corner is (0,0) and right top (y-1, x-1)
    clean_plan.reverse
  end

  # prepare a readable planet plan
  def nice_plan

    # get the current plan
    array = plan
    map = String.new

    # do upper border
    map << '#'*(@x+2) << "\n"

    # put the object face on the plan or a dot if nil
    # do the side borders
    @x.times do |i|
      map << "|"
      @y.times do |j|
        field = array[i][j]
        map << (field.nil? ? '.' : field.face)
      end
      map << "|\n"
    end

    # do the footer border
    return map << '#'*(@x+2) << "\n"
  end

  # printing a nice prepared plan
  def print_plan
    print nice_plan
  end

  private

  # checks if rover already is on a list 
  def known?(rover)
    @rovers.detect { |x| x.equal?(rover) }
  end

end
