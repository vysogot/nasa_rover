require 'helper'

class TestHouston < Test::Unit::TestCase

  def setup
    @houston = Houston.new('/home/jgodawa/ruby/nasa-rover/test/fixtures/test_input.txt')
  end
  
  should "initialize properly and set the planet" do
    assert @houston.planet.kind_of?(Planet) 
  end

  should "give proper output for test_input.txt" do
    @houston.start_the_mission!

    wanted_report=<<ENDY
1 3 N
5 1 E
ENDY

    p @houston.mission_report
    assert @houston.mission_report == wanted_report
  end
end
 
