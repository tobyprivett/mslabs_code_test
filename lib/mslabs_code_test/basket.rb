module MslabsCodeTest
  class Basket
    attr_accessor :items, :total

    def initialize
      @items = []
      @total = 0.0
    end

    def add_items(items)
      items.each do |item|
        @items << Inventory.products.find{|product| product.code == item}
      end
    end

    def calculate_total
      subtotal
      add_delivery_charge
      total_in_pounds
    end

    private

    def total_in_pounds
      "£%.2f" % @total
    end

    def add_delivery_charge
      @total +=
        case @total
          when 0.01..49.99 then 4.95
          when 50.0..89.99 then 2.95
          else 0
        end
    end

    def subtotal
      @items.each do |item|
        @total += item.price
      end
    end
  end
end
