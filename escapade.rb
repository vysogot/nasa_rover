require './lib/nasa-rover/rover.rb'
require './lib/nasa-rover/planet.rb'
require './lib/nasa-rover/x_soft.rb'
require './lib/nasa-rover/houston.rb'
require './lib/nasa-rover/orders_reader.rb'
require './lib/nasa-rover/file_orders_reader.rb'
require './lib/nasa-rover/string_orders_reader.rb'

houston = Houston.new('./test/fixtures/test_input.txt')
houston.start_the_mission!

puts houston.mission_report
