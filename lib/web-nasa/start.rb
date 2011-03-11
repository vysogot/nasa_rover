require 'observer'

require '../../lib/nasa-rover/rover.rb'
require '../../lib/nasa-rover/planet.rb'
require '../../lib/nasa-rover/x_soft.rb'
require '../../lib/nasa-rover/houston.rb'
require '../../lib/nasa-rover/orders_reader.rb'
require '../../lib/nasa-rover/file_orders_reader.rb'
require '../../lib/nasa-rover/string_orders_reader.rb'

require 'sinatra'
require 'erb'

require './routes.rb'

class Universe
  MARS = Planet.new(5,5)
end

get '/' do
  erb :index
end

get '/sr' do
  Rover.new.send_on_planet(Universe::MARS, 1, 1, 'N')
  erb :index
end

get '/ss/:signal' do |signal|
  r = Universe::MARS.rovers[0]
  r.receive_signal(signal)
  if r.position[0,2] == [2,3]
    erb :win
  else
    erb :index
  end
end
