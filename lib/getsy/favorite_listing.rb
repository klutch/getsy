module Getsy

  class FavoriteListing
    attr_accessor(
      :listing_id,
      :user_id,
      :listing_state,
      :create_date
    )
    attr_reader(
      :user,
      :listing
    )
    
    def user=(value)
      @user = Getsy::User.new(value)
    end
    
    def listing=(value)
      @listing = Getsy::Listing.new(value)
    end
    
    def self.find_all_listing_favored_by(listing_id, options = nil)
      options ||= {}
      options["force_array"] = true

      listings = []
      response = Getsy.api_call("/listings/#{listing_id}/favored-by", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def self.find_all_user_favorite_listings(user_id, options = nil)
      options ||= {}
      options["force_array"] = true

      listings = []
      response = Getsy.api_call("/users/#{user_id}/favorites/listings", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def self.find_user_favorite_listings(user_id, listing_id, options = nil)
      options ||= {}
      options["force_array"] = true
      
      listings = []
      response = Getsy.api_call("/users/#{user_id}/favorites/listings/#{listing_id}", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def initialize(params = nil)
      Getsy.build_from_params(self, params) if params
    end
    
  end

end
