module MslabsCodeTest
  class Discount

    attr_accessor :offers

    def self.parse_json(discounts_json)
      JSON.parse(discounts_json, symbolize_names: true).map do |json|

        Discount.new(
          product_combo: json[:product_combo],
          offers: json[:offers].map{ |offer|
            Offer.new(
                code: offer[:code],
                discount: offer[:discount]
              )
            }
          )
      end
    end

    def initialize(product_combo: nil, offers: [])
      @product_combo = product_combo
      @offers = offers
    end

    def apply_to_product_codes(items=[])
      discount = 0
      offers.each do |offer|
        if units_to_discount = items_in?(items)

          discount += units_to_discount * offer.discount * items.find{ |item| item.code == offer.code }.price

        end
      end
      discount
    end


    def items_in?(items)
      items.map(&:code).sort.join(',').scan(@product_combo.sort.join(',')).size
    end


    class Offer
      attr_accessor :code, :discount

      def initialize(code: nil, discount: 0.0)
        @code = code
        @discount = discount
      end
    end
  end
end
