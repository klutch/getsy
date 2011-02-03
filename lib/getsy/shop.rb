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
    
    def user=(value)
      @user = Getsy::User.new(value)
    end
    
    def sections=(value)
      @sections = []
      value.each do |section|
      	@sections.push(Getsy::Section.new(section))
      end
      @sections
    end
    
    def listings=(value)
      @listings = []
      value.each do |listing|
        @listings.push(Getsy::Listing.new(listing))
      end
      @listings
    end
		
    def self.find_all_shops(options = nil)
      shops = []
      response = Getsy.api_call("/shops", options)
      response.each do |shop|
        shops.push(new(shop))
      end
      shops
    end
    
    def self.find_all_user_shops(user_id, options = nil)
      shops = []
      response = Getsy.api_call("/users/#{user_id}/shops", options)
      response.each do |shop|
        shops.push(new(shop))
      end
      shops
    end
    
    def self.get_shop(shop_id, options = nil)
      response = Getsy.api_call("/shops/#{shop_id}", options)
      new(response[0])
    end
    
    def initialize(params = nil)
      Getsy.build_from_params(self, params) if params
    end
		
  end
end
