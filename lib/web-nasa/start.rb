# put nasa-rover to load_path
$LOAD_PATH.unshift(File.join(File.dirname(File.absolute_path(__FILE__)), '../..', "lib"))
$LOAD_PATH.unshift(File.join(File.dirname(File.absolute_path(__FILE__)), '../..', "lib", "nasa-rover"))

# sintara files
require 'sinatra'
require 'erb'

# join controller with application
require './routes.rb'
require 'nasa-rover'

# create the Universe (small one :))
class Universe
  MARS = Planet.new(5,5)
end
