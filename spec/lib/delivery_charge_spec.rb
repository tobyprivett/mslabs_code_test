require "spec_helper"
require "mslabs_code_test"
require "pry"
include MslabsCodeTest

describe MslabsCodeTest::DeliveryCharge do
  context "#price_bands" do

    let!(:price_bands) { DeliveryCharge.price_bands(File.read("data/delivery_charges.json")) }

    it "has a 4.95 price band" do
      expect(price_bands.first).to eq(
          {
            price_min: 0.01,
            price_max: 49.99,
            charge: 4.95
          }
        )
    end

    it "has a 2.95 price band" do
      expect(price_bands.last).to eq(
          {
            price_min: 50.00,
            price_max: 89.99,
            charge: 2.95
          }
        )
    end
  end
end
