require 'httparty'
require 'json'

class SinglePostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_postcode
    puts @single_postcode_data["result"]["postcode"]
  end

end

s = SinglePostcodeService.new
s.get_single_postcode("w93ul")
s.print_result



