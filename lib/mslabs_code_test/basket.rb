module MslabsCodeTest
  class Basket
    attr_accessor :items

    def initialize
      @items = []
    end

    def add(items)
      items.each do |item|
        @items << Inventory.products.find{|product| product.code == item}
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
      @total +=
        case @total
          when 0.01..49.99 then 4.95
          when 50.0..89.99 then 2.95
          else 0
        end
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
