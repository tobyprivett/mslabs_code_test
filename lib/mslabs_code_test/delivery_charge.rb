module MslabsCodeTest
  class DeliveryCharge

    attr_accessor

    def self.price_bands(delivery_charges_json)
      JSON.parse(delivery_charges_json, symbolize_names: true).map do |json|
        {
          price_min: json[:price_min],
          price_max: json[:price_max],
          charge: json[:charge]
        }
      end
    end
  end
end
