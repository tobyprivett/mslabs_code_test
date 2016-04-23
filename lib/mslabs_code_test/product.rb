module MslabsCodeTest
  class Product

    attr_accessor :description, :code, :price, :discount

    def initialize(opts)
      @description = opts[:description]
      @code = opts[:code]
      @price = opts[:price]
      @discount = opts[:discount].to_sym if opts[:discount]
    end
  end
end
