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

  	@place=Place.create(name: "David", latt: "-77.034084142948", longt: "38.909671288923")
  	#@place1=Place.find(2).to_json
  	@place3=Place.last(10).to_json(:only =>[:id,:name,:latt]) # map the variables we want to convert to Json
	@place2=Place.last(5)
	@geojson=Array.new
	@place2.each do |place|
		@geojson << {
			type: 'Feature',
			geometry:{
				type: 'Point',
				coordinates: [place.longt,place.latt]
			},
			properties: {
				name: place.name,
				address: place.street,
     		    :'marker-color' => '#00607d',
                :'marker-symbol' => 'circle',
                :'marker-size' => 'medium'






				#rest of properties if nessesary
			}
		}
	end

	
	erb :secondtest
end
