module Getsy

	# Resource: User
	#   http://developer.etsy.com/docs/read/resource_user
  class User
  	attr_accessor(
  		:user_id,
  		:login_name,
  		:creation_tsz,
  		:referred_by_user_id,
  		:feedback_info
  	)
  	attr_reader(
  		:shops,
  		:profile,
  		:feedback_as_author,
  		:feedback_as_subject,
  		:feedback_as_seller,
  		:favorite_listings,
  		:favorite_users,
  		:favored_by
  	)
  	
  	def shops=(value)
  	  @shops = []
			value.each do |shop|
				@shops.push(Getsy::Shop.new(shop))
			end
  	end
  	
  	def profile=(value)
  		@profile = Getsy::Profile.new(value)
  	end

		# TODO: Implement the rest of the associations
  	
  	def self.get_user(user_id, options = {})
  		response = Getsy.api_call("/users/#{user_id}", options)
  		new(response)
  	end

  	def initialize(params = nil)
  		Getsy.build_from_params(self, params) if params
  	end
  	
  end

end
