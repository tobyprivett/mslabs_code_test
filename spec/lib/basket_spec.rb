require "spec_helper"
require "mslabs_code_test"

describe MslabsCodeTest::Basket do
  it "initializes a Basket" do
    expect(MslabsCodeTest::Basket.new).to be_a(MslabsCodeTest::Basket)
  end

  describe "making a purchase" do
    let!(:basket) { MslabsCodeTest::Basket.new }

    before { basket.add_products(products) }

    subject { basket.calculate_total }

    context "with no products" do
      let(:products) { [] }

      it "totals 0.00" do
        expect(subject).to eql(0.00)
      end
    end
  end
end
