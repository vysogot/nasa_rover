require 'helper'

class TestStringOrdersReader < Test::Unit::TestCase

  def setup
    orders = File.new('test/fixtures/test_input.txt').readlines.join
    @string_orders_reader = StringOrdersReader.new(orders)
  end

  should "raise no errors when initialized with a string" do
    assert_nothing_raised { StringOrdersReader.new("5 5\n6 1 N\nMMRMMLMMMMMM\n") }
  end

  should "get the planet dimensions from the orders" do
    assert_equal(@string_orders_reader.get_planet, ["5", "5"])
  end

  should "get the next rover data, including its position and list of signals" do
    @string_orders_reader.get_planet
    x, y, face, signals = @string_orders_reader.next_rover_data
    assert_equal([x, y, face, signals], ["1", "2", "N", ["L","M","L","M","L","M","L","M","M"]])

    x, y, face, signals = @string_orders_reader.next_rover_data
    assert_equal([x, y, face, signals], ["3", "3", "E", ["M","M","R","M","M","R","M","R","R","M"]])
  end

end
