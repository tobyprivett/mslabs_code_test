module MslabsCodeTest
  class Basket
    attr_accessor :items

    def initialize
      self
      @items = []
    end

    def add_products(items)
      @items << items
    end

    def calculate_total
     0.00
    end
  end
end
