module Getsy

  # Resource: Payment
  #   http://developer.etsy.com/docs/resource_listingpayment
  class Payment
    attr_accessor(
      :listing_payment_id,
      :allow_check,
      :allow_mo,
      :allow_other,
      :allow_paypal
    )
    attr_reader(
      :country,
      :listing
    )
    
    def country=(value)
      @country = Getsy::Country.new(value)
    end
    
    def listing=(value)
      @listing = Getsy::Listing.new(value)
    end
    
    def self.get_listing_payment(listing_payment_id, options = nil)
      response = Getsy.api_call("/payments/#{listing_payment_id}", options)
      new(response[0])
    end
 
    def self.get_listing_payment_info(listing_id, options = nil)
      payments = []
      response = Getsy.api_call("/listings/#{listing_id}/payments", options)
      response.each do |payment|
        payments.push(new(payment))
      end
      payments
    end
    
    def initialize(params = nil)
      Getsy.build_from_params(self, params) if params
    end
  end

end
