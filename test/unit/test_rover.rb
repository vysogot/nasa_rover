require 'helper'

describe Rover do

  before do
    @planet = Planet.new(5,5)
    @rover = Rover.new
    @rover.send_on_planet(@planet, 3, 4, 'N')
  end

  #
  # testing rover with XSoft software
  #

  it "creates a simple rover with a given position" do
    assert_equal @rover.position, [3, 4, 'N']
  end

  it "returns proper face after it turns" do
    'LRRLLLRLLRLLRRR'.each_char {|signal| @rover.receive_signal(signal) }
    assert_equal @rover.face, 'W'
  end

  it "returns proper position after it moves north" do
    assert_equal Rover.new.send_on_planet(@planet, 1, 1, 'N').receive_signal('M').position, [1, 2, 'N']
  end

  it "returns proper position after it receive_signal('M')s east" do
    assert_equal Rover.new.send_on_planet(@planet, 1, 1, 'E').receive_signal('M').position, [2, 1, 'E']
  end

  it "returns proper position after it receive_signal('M')s south" do
    assert_equal Rover.new.send_on_planet(@planet, 1, 1, 'S').receive_signal('M').position, [1, 0, 'S']
  end

  it "returns proper position after it receive_signal('M')s west" do
    assert_equal Rover.new.send_on_planet(@planet, 1, 1, 'W').receive_signal('M').position, [0, 1, 'W']
  end

end
