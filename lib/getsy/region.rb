module Getsy

  # Resource: Region
  #   http://developer.etsy.com/docs/resource_region
  class Region
    attr_accessor(
      :region_id,
      :region_name
    )
    
    def self.find_all_regions(options = nil)
      find_all_region(options)
    end
    
    def self.find_all_region(options)
      regions = []
      response = Getsy.api_call("/regions", options)
      response.each do |region|
        regions.push(new(region))
      end
      regions
    end
    
    def initialize(params = nil)
      Getsy.build_from_params(self, params) if params
    end
    
  end

end
