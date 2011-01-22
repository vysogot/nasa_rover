require './lib/nasa-rover/rover.rb'
require './lib/nasa-rover/planet.rb'
require './lib/nasa-rover/x_soft.rb'
require './lib/nasa-rover/houston.rb'

houston = Houston.new('./test/fixtures/test_input.txt')
houston.start_the_mission!

puts houston.mission_report
