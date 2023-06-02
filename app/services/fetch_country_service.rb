require 'net/http'

class FetchCountryService
    attr_reader :ip

    def initialize(ip)
        @ip = ip
    end

    def perform
        #Llamamos al api de ip-api y usamos country Code
        uri = URI("http://ip-api.com/json/#{ip}")
        response = Net::HTTP.get(uri)
        parsed_response = JSON.parse(response)
        status = parsed_response.dig("status")
        if status == "success"
            parsed_response.dig("countryCode").downcase
        else
            nil
        end
    rescue
        nil
    end
end