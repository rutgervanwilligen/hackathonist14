require 'citysdk'
require 'json'

nr = 1
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
layer = "hackathonist.team#{nr}.<<layer name here>>"

# 1. Parse the input zones from file using json
data = File.open './test.geojson', 'r:UTF-8'
geojson = JSON.parse data.read

# Process raw data make it useful for CitySDK
# Each node should have unique id, GeoJSON geometry and key/value data
citysdk_json = geojson["features"].map do | feature |
  {
		id: feature["properties"]["id"],
		name: feature["properties"]["type"],
		geom: feature["geometry"],
		data: {
			type: feature["properties"]["type"],
		}
	}
end

#2. Put stuff in citysdk

api = CitySDK::API.new("apicitysdk.ibb.gov.tr")

begin

	api.authenticate(email, password)
	# Add parsed data to layer
	api.set_layer layer
	citysdk_json.each do |node|
		#puts node 
		api.create_node node
	end

ensure
	# Always release api, no matter what happens
	api.release
end
