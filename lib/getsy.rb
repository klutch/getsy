require 'getsy/user'
require 'getsy/shop'
require 'getsy/profile'
require 'getsy/country'
require 'getsy/section'
require 'getsy/listing'
require 'getsy/image'
require 'getsy/shipping_info'
require 'getsy/region'
require 'getsy/payment'
require 'getsy/favorite_listing'

module Getsy
  # API_KEY is defined in an initializer
  API_URL = "http://openapi.etsy.com/v2/public"

  class << self
    def api_call(action, options)
      response = Net::HTTP.get(URI.parse(build_url(action, options)))
      response = JSON.parse(response)
      response["results"]
    end

    def build_from_params(instance, params)
      params.each do |key, value|
        if key.to_s.underscore == "url_570x_n"
          property = "url_570xN"
        else
          property = key.to_s.underscore
        end
        instance.send("#{property}=", value)
      end
    end
    
    private
      def build_url(action, options)
        if options
          extras = "&"
          options.each do |key, value|
            if key == :includes
              extras += "includes=#{value}"
            end
          end
        end
        
        final = "#{Getsy::API_URL}#{action}?api_key=#{Getsy::API_KEY}#{extras}"
        puts "Calling:#{final}"
        final
      end
    end
    
end
