require "spec_helper"
require "mslabs_code_test"

describe MslabsCodeTest::Basket do
  it "initializes a Basket" do
    expect(MslabsCodeTest::Basket.new).to be_a(MslabsCodeTest::Basket)
  end
end
