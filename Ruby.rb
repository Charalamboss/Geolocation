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

def placeslist #create a list with all places
	@place2=Place.all
	@geojson=Array.new
	@place2.each do |place|
		@geojson << {
			type: 'Feature',
			geometry:{
				type: 'Point',
				coordinates: [place.latt.to_f,place.longt.to_f]
			},
			properties: {
				name: place.name,
				address: place.id,
     		    :'marker-color' => '#00607d',
                :'marker-symbol' => 'circle',
                :'marker-size' => 'medium'
				#rest of properties are  unnessesary
			}
		}
	end
	return @geojson
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
	
    #@Place=Place.delete_all
  	#@place=Place.create(name: "David2", latt: "-77.034084142948", longt: "38.909671288923")
  	#@place=Place.create(name: "chuck", latt: "-77.049766", longt: "38.900772")
  	#@place=Place.create(name: "Pampos", latt: "-77.043929",longt:"38.910525")
  #	@place=Place.create(name:"Giannis1", latt: "-77.0672", longt:"38.90516896")
  	#@place=Place.create(name:"Giannis2", latt: "-77.0676", longt:"38.90516898")
  #	@place=Place.create(name:"Giannis3", latt: "-77.0671", longt:"38.90516891")
  #	@place=Place.create(name:"Giannis4", latt: "-77.0673", longt:"38.90516895")
  #	@place=Place.create(name:"Giannis5", latt: "-77.0674", longt:"38.905168999")
  #	@place=Place.create(name:"Giannis6", latt: "-77.0675", longt:"38.90516899")
  #	@place=Place.create(name:"Giannis7", latt: "-77.0671", longt:"38.90516890")
  #	@place=Place.create(name:"Giannis8", latt: "-77.0679", longt:"38.905168981", type1:"alo")
  	#@place1=Place.find(2).to_json
  	#@place3=Place.last(10).to_json(:only =>[:id,:name,:latt]) # map the variables we want to convert to Json
	placeslist

	erb :secondtest
end

post '/newplace' do
	@name=params[:placename].to_s
	@lat=params[:lat].to_s
	@lon=params[:long].to_s
	@place=Place.create(name:@name,latt:@lat,longt:@lon)
	

	erb :newplace
	end
get '/newplace' do
	erb :newplace
end
