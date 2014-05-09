require 'citysdk'

nr = #<<insert team number here>>
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
layer = "hackathonist.team#{nr}.layer"

# cdk_id: Node ID from which data needs to be removed
cdk_id = 'accommodation.89'

api = CitySDK::API.new("apicitysdk.ibb.gov.tr")

begin

	api.authenticate(email, password)
	api.set_layer layer

	# Also removes node when last layer describing this node is removed
	api.delete("#{cdk_id}/#{layer}")

ensure

	api.release

end
