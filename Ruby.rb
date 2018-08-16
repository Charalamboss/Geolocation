require 'rubygems'
require 'sinatra'

get '/' do
  'Welcome to BookList!'
  @testlon="-33.863276"
  @testla=151.207977
  erb :index
end
get '/mapbox' do 
	erb :testMapBox
end

get '/second' do
	erb :secondtest
end
