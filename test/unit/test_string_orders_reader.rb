require 'helper'

describe StringOrdersReader do

  before do
    orders = File.new('test/fixtures/test_input.txt').readlines.join
    @string_orders_reader = StringOrdersReader.new(orders)
  end

  it "raises no errors when initialized with a string" do
    StringOrdersReader.new("5 5\n6 1 N\nMMRMMLMMMMMM\n")
  end

  it "gets the planet dimensions from the orders" do
    assert_equal(@string_orders_reader.get_planet, ["5", "5"])
  end

  it "gets the next rover data, including its position and list of signals" do
    @string_orders_reader.get_planet
    x, y, face, signals = @string_orders_reader.next_rover_data
    assert_equal([x, y, face, signals], ["1", "2", "N", ["L","M","L","M","L","M","L","M","M"]])

    x, y, face, signals = @string_orders_reader.next_rover_data
    assert_equal([x, y, face, signals], ["3", "3", "E", ["M","M","R","M","M","R","M","R","R","M"]])
  end

end
