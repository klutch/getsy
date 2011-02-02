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
    
    def initialize(params)
      Getsy.build_from_params(self, params) if params
    end
  
  end

end

