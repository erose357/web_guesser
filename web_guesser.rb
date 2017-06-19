require 'sinatra'
require 'sinatra/reloader'

random_number = rand(101)

get '/' do
  "THE SECRET NUMBER is #{random_number}"
end
