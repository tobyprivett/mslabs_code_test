require 'spec_helper'
require "mslabs_code_test"
require "pry"
include MslabsCodeTest

describe MslabsCodeTest::Discount do
  let!(:discounts) { File.read("data/discounts.json") }

  describe '#parse_json' do
    subject { Discount.parse_json(discounts) }

    it "has one discount" do
      expect(subject.length).to eql(1)
    end

    context 'with the first discount' do
      let(:offer) { subject.first.offers }

      it 'has an offer' do
        expect(offer.length).to eql(1)
      end
   end
  end
end
