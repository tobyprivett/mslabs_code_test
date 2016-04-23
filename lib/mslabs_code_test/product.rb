module MslabsCodeTest
  class Product

    attr_accessor :description, :code, :price

    def initialize(description, code, price)
      @description = description
      @code = code
      @price = price
    end
  end
end
