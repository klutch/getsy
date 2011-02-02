module Getsy

  # Resource: Section
  #   http://developer.etsy.com/docs/read/resource_shopsection
  class Section
    attr_accessor(
      :shop_section_id,
      :title,
      :rank,
      :user_id,
      :active_listing_count
    )
    attr_reader(
      :shop,
      :listings
    )
    
    def shop=(value)
      @shop = Getsy::Shop.new(value)
    end
    
    def listings=(value)
      @listings = []
      value.each do |listing|
        @listings.push(Getsy::Listing.new(listing))
      end
    end
    
    def initialize(params)
      Getsy.build_from_params(self, params) if params
    end
  
  end

end
