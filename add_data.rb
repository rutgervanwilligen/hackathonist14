require 'citysdk'

nr = 1
email = "team#{nr}@hackathonist.com"
password = "Team#{nr}.hackathonist"

# Layer must exist!
layer = "team#{nr}.hackathonist"
cdk_id = 'accommodation.89'

api = CitySDK::API.new("apicitysdk.ibb.gov.tr")

api.authenticate(email, passw)
api.set_layer layer

data = {
  test: 'test'
}

api.put("#{cdk_id}/#{layer}", {data: data})

api.release
