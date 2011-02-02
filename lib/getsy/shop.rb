module Getsy

	# Resource: Shop
	#   http://developer.etsy.com/docs/read/resource_shop
	class Shop
		attr_accessor(
			:shop_id,
			:shop_name,
			:user_id,
			:creation_tsz,
			:title,
			:announcement,
			:currency_code,
			:is_vacation,
			:vacation_message,
			:sale_message,
			:last_updated_tsz,
			:listing_active_count,
			:login_name,
			:alchemy_message,
			:is_refusing_alchemy,
			:policy_welcome,
			:policy_payment,
			:policy_shipping,
			:policy_refunds,
			:policy_additional,
			:policy_updated_tsz,
			:vacation_autoreply,
			:url,
			:image_url_760x100,
			:num_favorers
		)
		attr_reader(
			:user,
			:sections,
			:listings
		)
		
		def self.find_all_shops(options = nil)
			shops = []
			response = Getsy.api_call("/shops", options)
			response.each do |shop|
				shops.push(new(shop))
			end
			shops
		end
		
		def initialize(params = nil)
			Getsy.build_from_params(self, params) if params
		end
		
	end
end
