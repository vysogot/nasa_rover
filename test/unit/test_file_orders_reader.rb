require 'helper'

class TestFileOrdersReader < Test::Unit::TestCase

  def setup
    @file_orders_reader = FileOrdersReader.new('test/fixtures/test_input.txt')
  end

  should "raise no errors when initialized with a file" do
    assert_nothing_raised { FileOrdersReader.new('test/fixtures/test_input.txt') }
  end

  should "get the planet dimensions from the orders" do
    assert_equal(@file_orders_reader.get_planet, ["5", "5"])
  end

  should "get the next rover data, including its position and list of signals" do
    @file_orders_reader.get_planet
    x, y, face, signals = @file_orders_reader.next_rover_data
    assert_equal([x, y, face, signals], ["1", "2", "N", ["L","M","L","M","L","M","L","M","M"]])

    x, y, face, signals = @file_orders_reader.next_rover_data
    assert_equal([x, y, face, signals], ["3", "3", "E", ["M","M","R","M","M","R","M","R","R","M"]])
  end

end
