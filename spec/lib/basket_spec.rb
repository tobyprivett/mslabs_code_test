require "spec_helper"
require "mslabs_code_test"

describe MslabsCodeTest::Basket do
  it "initializes a Basket" do
    expect(MslabsCodeTest::Basket.new).to be_a(MslabsCodeTest::Basket)
  end

  describe "making a purchase" do
    let!(:basket) { MslabsCodeTest::Basket.new }

    before { basket.add_items(products) }

    subject { basket.calculate_total }

    context "with no products" do
      let(:products) { [] }

      it "totals 0.00" do
        expect(subject).to eql("£0.00")
      end
    end

    context "with a pair of socks and a blouse" do
      let(:products) { %w{ S01 B01 } }

      it "has 2 items" do
        expect(basket.items.length).to eql(2)
      end

      it "totals 37.85" do
        expect(subject).to eql("£37.85")
      end
    end
  end
end
