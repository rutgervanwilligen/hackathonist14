require 'citysdk'

nr = 1
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
layer = "hackathonist.team#{nr}.<<layer name here>>"
cdk_id = 'accommodation.89'

api = CitySDK::API.new("apicitysdk.ibb.gov.tr")

begin

	api.authenticate(email, password)
	api.set_layer layer

	data = {
	  test: 'test'
	}

	api.put("#{cdk_id}/#{layer}", {data: data})

ensure

	api.release

end
