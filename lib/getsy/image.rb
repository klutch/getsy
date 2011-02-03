module Getsy

  class Image
    attr_accessor(
      :listing_image_id,
      :hex_code,
      :red,
      :green,
      :blue,
      :hue,
      :saturation,
      :brightness,
      :is_black_and_white,
      :creation_tsz,
      :listing_id,
      :rank,
      :url_75x75,
      :url_170x135,
      :url_570xN,
      :url_fullxfull
    )
    attr_reader(
      :listing
    )
    
    def listing=(value)
      @listing = Getsy::Listing.new(value)
    end
    
    def self.find_all_listing_images(listing_id, options = nil)
      listings = []
      response = Getsy.api_call("/listings/#{listing_id}/images", options)
      response.each do |listing|
        listings.push(new(listing))
      end
      listings
    end
    
    def self.get_listing_image(listing_id, listing_image_id, options = nil)
      response = Getsy.api_call("/listings/#{listing_id}/images/#{listing_image_id}", options)
      new(response)
    end
    
    def initialize(params)
      Getsy.build_from_params(self, params) if params
    end
  end

end
