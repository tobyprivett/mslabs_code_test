module MslabsCodeTest
  class Basket
    attr_accessor :items

    def initialize
      self
      @items = []
    end

    def add_items(items)
      items.each do |item|
        @items << Inventory.products.find{|product| product.code == item}
      end
    end

    def calculate_total
     0.00
    end
  end
end
