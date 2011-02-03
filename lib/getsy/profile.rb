module Getsy

  # Resource: Profile
  #   http://developer.etsy.com/docs/resource_userprofile
  class Profile
    attr_accessor(
      :user_profile_id,
      :user_id,
      :login_name,
      :bio,
      :gender,
      :birth_month,
      :birth_day,
      :join_tsz,
      :materials,
      :country_id,
      :city,
      :location,
      :avatar_id,
      :transaction_buy_count,
      :transaction_sold_count,
      :is_seller,
      :image_url_75x75,
      :first_name,
      :last_name
    )
    attr_reader(
      :country,
      :user,
      :shops
    )

    def shops=(value)
      @shops = []
      value.each do |shop|
        @shops.push(Getsy::Shop.new(shop))
      end
    end

    def user=(value)
     @user = Getsy::User.new(value)
    end

    def country=(value)
      @country = Getsy::Country.new(value)
    end

    def initialize(params = nil)
      Getsy.build_from_params(self, params) if params
    end

  end
end
