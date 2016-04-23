require "spec_helper"
require "mslabs_code_test"

include MslabsCodeTest

describe MslabsCodeTest::Inventory do
  context "#products" do

    subject { Inventory.products }
    it "has three products" do
      expect(subject[0].code).to eq("J01")
      expect(subject[1].code).to eq("B01")
      expect(subject[2].code).to eq("S01")
    end
  end
end
