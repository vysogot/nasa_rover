require 'helper'

describe Houston do

  before do
    @houston = Houston.new('test/fixtures/test_input.txt')
  end

  it "initializes properly and set the planet" do
    assert @houston.instance_variable_get(:@planet).kind_of?(Planet)
  end

  it "gives proper output for test_input.txt" do
    @houston.start_the_mission!

    wanted_report = "1 3 N\n5 1 E\n"

    assert_equal(@houston.mission_report, wanted_report)
  end

  it "reports if a rover missed the planet" do
    orders = "5 5\n6 1 N\nMMRMMLMMMMMM\n"

    houston = Houston.new(orders)
    houston.start_the_mission!
    assert_equal(houston.mission_report, "Mission of Rover-0 on Mars failed: it missed the planet\n")
  end

  it "reports if a rover fell of the planet" do
    orders = "5 5\n1 1 N\nMMRMMLMMMMMM\n"

    houston = Houston.new(orders)
    houston.start_the_mission!
    assert_equal(houston.mission_report, "Mission of Rover-0 on Mars failed: it fell of the planet\n")
  end

end
