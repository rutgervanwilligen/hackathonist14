require 'citysdk'

nr = 1
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
layer = "team#{nr}.hackathonist"
cdk_id = 'accommodation.89'

api = CitySDK::API.new("apicitysdk.ibb.gov.tr")

begin

	api.authenticate(email, passw)
	api.set_layer layer

	api.delete("#{cdk_id}/#{layer}")

ensure

	api.release

end
