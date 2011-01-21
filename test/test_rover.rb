require 'helper'

class TestRover < Test::Unit::TestCase
  should "create a simple rover with a name" do
    name = "Discovery XING"
    rover = Rover.new(name)
    assert rover.name == name
  end
end
