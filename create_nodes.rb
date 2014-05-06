require 'citysdk'
require 'json'

nr = 1
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
layer = "team#{nr}.hackathonist"
cdk_id = 'accommodation.89'

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
begin

	# Add parsed data to layer
	api.set_layer layer
	citysdk_json.each do |node|
		#puts zone
		api.create_node node
	end

ensure
	# Always release api, no matter what happens
	api.release
end