require 'helper'

describe Planet do

  before do
    @planet = Planet.new(5,5)
    @rover = Rover.new
    @rover.send_on_planet(@planet, 1, 1, 'N')
  end

  it "returns right rover position on a map when a rover lands" do
    assert_equal @planet.plan[4], [@rover, nil, nil, nil, nil]
  end

  it "returns right rover position on a map when a rover moves" do
    @rover.receive_signal('M')

    assert_equal @planet.plan[3], [@rover, nil, nil, nil, nil]
  end

  it "returns right rover position on a map when a rover turns" do
    @rover.receive_signal('L')

    assert_equal @planet.plan[4], [@rover, nil, nil, nil, nil]
  end

  it "returns right rover position on a map after a longer trip" do
    "MMRMMLMRRM".each_char { |signal| @rover.receive_signal(signal) }

    assert_equal @planet.plan[2], [nil, nil, @rover, nil, nil]
  end

  it "follows three rovers and return their correct positions" do
    rover2 = Rover.new.send_on_planet(@planet, 4, 5, 'S')
    rover3 = Rover.new.send_on_planet(@planet, 2, 4, 'E')

    "MMRMM".each_char do |signal|
      @rover.receive_signal(signal)
      rover2.receive_signal(signal)
      rover3.receive_signal(signal)
    end

    assert_equal(@planet.plan, [
        [nil, nil,    nil,    nil,    nil],
        [nil, nil,    nil,    nil,    nil],
        [nil, rover2, @rover, nil,    nil],
        [nil, nil,    nil,    rover3, nil],
        [nil, nil,    nil,    nil,    nil]
      ])
  end

  it "properly prepare a nice plan for printing" do
    expected_plan=<<FINITO
#######
|.....|
|.....|
|.....|
|.....|
|N....|
#######
FINITO

    assert_equal(@planet.nice_plan, expected_plan)
  end
end
