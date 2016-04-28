module MslabsCodeTest
  class Basket
    attr_accessor :items, :inventory, :delivery_charges, :discounts

    def initialize(products, delivery_charges, discounts)
      @inventory = Inventory.new(products)
      @delivery_charges = DeliveryCharge.price_bands(delivery_charges)
      @discounts = Discount.parse_json(discounts)
      @items = []
    end

    def add(items)
      items.each do |item|
        @items << @inventory.lookup(item)
      end
    end

    def total
      calculate_total!
    end

    private

    def calculate_total!
      @total = 0
      subtotal!
      apply_discounts!
      add_delivery_charge!
      total_in_pounds!
      @total
    end

    def total_in_pounds!
      @total = "£%.2f" % @total
    end

    def add_delivery_charge!
      delivery =
        @delivery_charges.find do |price_band|
          @total >= price_band[:price_min] && @total <= price_band[:price_max]
        end

      @total += delivery[:charge] if delivery
    end

    def subtotal!
      @items.each do |item|
        @total += item.price
      end
    end

    def apply_discounts!
      discounts_value = 0
      discounts.map do |discount|
        discounts_value += discount.apply_to_product_codes(items)
      end
      @total -= discounts_value
    end
  end
end
