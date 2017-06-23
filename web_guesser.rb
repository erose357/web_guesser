require 'sinatra'
require 'sinatra/reloader'

set :secret_number, rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => @secret_number,
                          :message       => message}
end

def check_guess(guess)
  if guess == "" || guess.nil?
    message = ""
  elsif guess.to_i < (settings.secret_number - 5)
    message = "Way too low!"
  elsif guess.to_i > (settings.secret_number + 5)
    message = "Way too high!"
  elsif guess.to_i < settings.secret_number
    message = "Too low!"
  elsif guess.to_i > settings.secret_number
    message = "Too high!"
  elsif guess.to_i == settings.secret_number
    message = "You got it right! The SECRET_NUMBER is #{settings.secret_number}"
  end
  return message
end
