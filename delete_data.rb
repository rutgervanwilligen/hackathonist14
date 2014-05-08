require 'citysdk'

nr = 1
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
# CDK_ID must exist!
layer = "hackathonist.team#{nr}.<<layer name here>>"
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
