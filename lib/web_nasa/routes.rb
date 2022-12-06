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
