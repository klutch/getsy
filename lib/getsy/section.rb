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
    
    def self.find_all_shop_sections(shop_id, options = nil)
      sections = []
      response = Getsy.api_call("/shops/#{shop_id}/sections", options)
      response.each do |section|
        sections.push(new(section))
      end
      sections
    end
    
    def self.get_shop_section(shop_section_id, options = nil)
      response = Getsy.api_call("/sections/#{shop_section_id}", options)
      new(response[0])
    end
    
    def initialize(params = nil)
      Getsy.build_from_params(self, params) if params
    end
  
  end

end
