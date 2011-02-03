module Getsy

  # Resource: ShippingInfo
  #   http://developer.etsy.com/docs/resource_shippinginfo
  class ShippingInfo
    attr_accessor(
      :shipping_info_id,
      :origin_country_id,
      :destination_country_id,
      :currency_code,
      :primary_cost,
      :secondary_cost,
      :listing_id,
      :region_id,
      :origin_country_name,
      :destination_country_name
    )
    attr_reader(
      :destination_country,
      :origin_country,
      :region
    )
    
    def destination_country=(value)
      @destination_country = Getsy::Country.new(value)
    end
    
    def origin_country=(value)
      @destination_country = Getsy::Country.new(value)
    end
    
    def region=(value)
      @region = Getsy::Region.new(value)
    end
    
    def initialize(params)
      Getsy.build_from_params(self, params) if params
    end
  end

end
