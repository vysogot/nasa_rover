require 'observer'

require_relative './lib/nasa_rover/rover.rb'
require_relative './lib/nasa_rover/planet.rb'
require_relative './lib/nasa_rover/x_soft.rb'
require_relative './lib/nasa_rover/houston.rb'
require_relative './lib/nasa_rover/orders_reader.rb'
require_relative './lib/nasa_rover/file_orders_reader.rb'
require_relative './lib/nasa_rover/string_orders_reader.rb'

houston = Houston.new('./test/fixtures/test_input.txt')
print houston.start_the_mission!
