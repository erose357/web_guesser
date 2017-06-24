require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :secret_number, rand(100)

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  if cheat == "true"
    cheat_mode
  else
    message = check_guess(guess)
    erb :index, :locals => {:secret_number => settings.secret_number,
                            :message       => message}
  end
end

def cheat_mode
  message = "The Secret Number is: #{settings.secret_number}"
  erb :cheat_mode, :locals => {:secret_number => settings.secret_number,
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
