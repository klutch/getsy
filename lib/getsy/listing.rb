module Getsy

  class Listing
    attr_accessor(
      :listing_id,
      :state,
      :user_id,
      :title,
      :description,
      :creation_tsz,
      :ending_tsz,
      :original_creation_tsz,
      :last_modified_tsz,
      :price,
      :currency_code,
      :quantity,
      :tags,
      :materials,
      :shop_section_id,
      :featured_rank,
      :state_tsz,
      :hue,
      :saturation,
      :brightness,
      :is_black_and_white,
      :url,
      :views,
      :num_favorers
    )
    attr_reader(
      :user,
      :shop,
      :section,
      :images,
      :main_image,
      :shipping_info,
      :payment_info,
      :favored_by
    )
    
    def user=(value)
      @user = Getsy::User.new(value)
    end
    
    def shop=(value)
      @shop = Getsy::Shop.new(value)
    end
    
    def section=(value)
      @section = Getsy::Section.new(value)
    end
    
    def images=(value)
      @images = []
      value.each do |image|
        @images.push(Getsy::Image.new(image))
      end
    end
    
    def main_image=(value)
      @main_image = Getsy::Image.new(value)
    end
    
    def shipping_info=(value)
      @shipping_info = []
      value.each do |info|
        @shipping_info.push(Getsy::ShippingInfo.new(info))
      end
      @shipping_info
    end
    
    def self.get_listing(listing_id, options = nil)
      response = Getsy.api_call("/listings/#{listing_id}", options)
      new(response)
    end
    
    def self.find_all_listings_active(options = nil)
      find_all_listing_active(options)
    end
    
    def self.find_all_listing_active(options = nil)
      listings = []
      response = Getsy.api_call("/listings/active", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def self.find_all_shop_listings_active(shop_id, options = nil)
      listings = []
      response = Getsy.api_call("/shops/#{shop_id}/listings/active", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def self.find_all_shop_listings_featured(shop_id, options = nil)
      listings = []
      response = Getsy.api_call("/shops/#{shop_id}/listings/featured", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def initialize(params)
      Getsy.build_from_params(self, params) if params
    end
  
  end

end

