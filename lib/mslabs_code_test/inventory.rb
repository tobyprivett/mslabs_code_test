module MslabsCodeTest
  class Inventory

    def self.products
      [
        Product.new("Jeans", "J01", 32.95),
        Product.new("Blouse", "B01", 24.95),
        Product.new("Socks", "S01", 7.95)
      ]
    end
  end
end
