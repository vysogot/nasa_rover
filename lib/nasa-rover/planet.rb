class Planet

  #
  # represents the planet Mars by its 
  # maximum two-dimension coordinates
  #

  attr_reader :x, :y, :name

  def initialize(x, y)
    @x, @y, @name = x, y, "Mars"
  end

end
