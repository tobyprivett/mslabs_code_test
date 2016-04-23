require "spec_helper"
require "mslabs_code_test"

describe MslabsCodeTest::Basket do

  describe "making a purchase" do

    let!(:inventory) { File.read("data/sample_products.json") }
    let!(:basket) { MslabsCodeTest::Basket.new(inventory) }

    before do
      basket.add(products)
    end

    subject { basket.total }

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

    context "with two pairs of jeans" do
      let(:products) { %w{ J01 J01 } }

      it "totals 54.37" do
        expect(subject).to eql("£54.37")
      end
    end

    context "with a pair of jeans and a blouse" do
      let(:products) { %w{ J01 B01 } }

      it "totals 60.85" do
        expect(subject).to eql("£60.85")
      end
    end


    context "with two pairs of socks and three pairs of jeans" do
      let(:products) { %w{ S01 S01 J01 J01 J01 } }

      it "totals 98.27" do
        expect(subject).to eql("£98.27")
      end
    end
  end
end
