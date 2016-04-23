module MslabsCodeTest
  class Product

    attr_accessor :description, :code, :price, :discount

    def initialize(description, code, price, discount=nil)
      @description = description
      @code = code
      @price = price
      @discount = discount
    end
  end
end
