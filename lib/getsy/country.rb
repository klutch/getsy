module Getsy

	class Country
		attr_accessor(
			:country_id,
			:iso_country_code,
			:world_bank_country_code,
			:name,
			:lat,
			:lon
		)

		def self.find_all_countries(options = nil)
			find_all_country(options)
		end

		def self.find_all_country(options = nil)
			countries = []
			response = Getsy.api_call("/countries", options)
			response.each do |country|
				countries.push(new(country))
			end
			countries
		end
		
		def self.get_country(country_id, options = nil)
			response = Getsy.api_call("/countries/#{country_id}", options)
			new(response)
		end
	
		def initialize(params)
			Getsy.build_from_params(self, params) if params
		end
	
	end

end
