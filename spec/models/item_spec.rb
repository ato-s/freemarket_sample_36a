require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid without a picture" do
    end

    it "is invalid without a name" do
      item = FactoryGirl.build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank.")
    end

    it "is invalid without a description" do
    end

    it "is invalid without a state" do
    end

    it "is invalid without a delivery_payer" do
    end

    it "is invalid without a delivery_region" do
    end

    it "is invalid without a delivery_duration" do
    end

    it "is invalid without a buy_price" do
    end

    it "is invalid without a sell_price" do
    end

    it "is invalid without a commission_price" do
    end

    it "is invalid without a transaction_stage" do
    end

    it "is invalid without a like_count" do
    end

    it "is invalid without a size_id" do
    end

    it "is invalid without a brand_id" do
    end

    it "is invalid without a upper_category_id" do
    end

    it "is invalid without a middle_category_id" do
    end

    it "is invalid without a lower_category_id" do
    end

    it "is invalid without a seller_id" do
    end

    it "is invalid without a buyer_id" do
    end

    it "is invalid without a created_at" do
    end

    it "is invalid without a updated_at" do
    end
  end
end
