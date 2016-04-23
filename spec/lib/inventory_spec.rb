require "spec_helper"
require "mslabs_code_test"

include MslabsCodeTest

describe MslabsCodeTest::Inventory do
  context "#products" do

    let!(:inventory) { Inventory.new(File.read("data/sample_products.json")) }

    it "has three products" do
      expect(inventory.lookup("J01").description).to eq("Jeans")
      expect(inventory.lookup("B01").description).to eq("Blouse")
      expect(inventory.lookup("S01").description).to eq("Socks")
    end
  end
end
