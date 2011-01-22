require 'helper'

class TestRover < Test::Unit::TestCase
  
  def setup
    @rover = Rover.new(3, 4, 'N')
  end

  # 
  # testing rover with XSoft software
  #

  should "create a simple rover with a given position" do
    assert @rover.position == [3, 4, 'N']
  end

  should "return proper face after it turns" do
    'LRRLLLRLLRLLRRR'.each_char {|signal| @rover.receive_signal(signal) }
    assert @rover.face == 'W'
  end

  should "return proper position after it moves north" do
    assert Rover.new(1, 1, 'N').receive_signal('M').position == [1, 2, 'N']
  end

  should "return proper position after it receive_signal('M')s east" do
    assert Rover.new(1, 1, 'E').receive_signal('M').position == [2, 1, 'E']
  end

  should "return proper position after it receive_signal('M')s south" do
    assert Rover.new(1, 1, 'S').receive_signal('M').position == [1, 0, 'S']
  end

  should "return proper position after it receive_signal('M')s west" do
    assert Rover.new(1, 1, 'W').receive_signal('M').position == [0, 1, 'W']
  end

end
