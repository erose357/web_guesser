require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(100)

get '/' do

  message = "Too low!" if params["guess"].to_i < secret_number
  message = "Too high!" if params["guess"].to_i > secret_number
  message = "Way too low!" if params["guess"].to_i < (secret_number - 5)
  message = "Way too high!" if params["guess"].to_i > (secret_number + 5)
  message = "" if params["guess"] == "" || params["guess"].nil?

  if params["guess"].to_i == secret_number
    message = "You got it right! The SECRET_NUMBER is #{secret_number}"
  end

  erb :index, :locals => {:secret_number => secret_number,
                          :message => message}
end
