module MslabsCodeTest
  class Inventory

    def initialize(products_json)
      @products =
        JSON.parse(products_json, symbolize_names: true).map do |product_json|
          Product.new(product_json)
      end
    end

    def lookup(code)
      @products.find{|product| product.code == code}
    end
  end
end
