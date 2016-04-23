module MslabsCodeTest
  class Basket
    attr_accessor :items, :inventory, :delivery_charges

    def initialize(products, delivery_charges)
      @inventory = Inventory.new(products)
      @delivery_charges = DeliveryCharge.price_bands(delivery_charges)
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
      bogohp_items = @items.select{|product| product.discount == :bogohp }

      unless bogohp_items.empty?
        discount = (bogohp_items.first.price / 2).round(2)
        eligible_items = bogohp_items.length / 2
        @total -= (eligible_items * discount).round(2)
      end
    end
  end
end
