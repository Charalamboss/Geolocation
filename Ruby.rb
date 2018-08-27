require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
 :adapter => 'sqlite3',
 :database => 'place.db'
)
class Place < ActiveRecord::Base
 validates :name, presence: true
end

get '/' do
  'Welcome to BookList!'
  @testlon="-33.863276"
  @testla=151.207977
  
  n.password = params[:password] 



  @place=Place.create(name: "David",)
  erb :index
end
get '/mapbox' do 
	erb :testMapBox
end

get '/second' do
	n = Place.new
    n.name = "para"

  	@place=Place.create(name: "David",)
  	@place1=Place.find(1)
  	@place3=Place.all.to_json(:only =>[:id,:name]) # map the variables we want to convert to Json
	@place2=Place.all
	erb :secondtest
end
