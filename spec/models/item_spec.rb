require 'rails_helper'

describe "Item" do
  describe '#create' do

    it "is valid with all all input items" do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a state" do
      item = build(:item, state: nil)
      item.valid?
      expect(item.errors[:state]).to include("can't be blank")
    end

    it "is invalid without a delivery_payer" do
      item = build(:item, delivery_payer: nil)
      item.valid?
      expect(item.errors[:delivery_payer]).to include("can't be blank")
    end

    it "is invalid without a delivery_region" do
      item = build(:item, delivery_region: nil)
      item.valid?
      expect(item.errors[:delivery_region]).to include("can't be blank")
    end

    it "is invalid without a delivery_duration" do
      item = build(:item, delivery_duration: nil)
      item.valid?
      expect(item.errors[:delivery_duration]).to include("can't be blank")
    end

    it "is invalid without a buy_price" do
      item = build(:item, buy_price: nil)
      item.valid?
      expect(item.errors[:buy_price]).to include("can't be blank")
    end

    it "is invalid without a sell_price" do
      item = build(:item, sell_price: nil)
      item.valid?
      expect(item.errors[:sell_price]).to include("can't be blank")
    end

    it "is invalid without a commission_price" do
      item = build(:item, commission_price: nil)
      item.valid?
      expect(item.errors[:commission_price]).to include("can't be blank")
    end

    it "is invalid without a transaction_stage" do
      item = build(:item, transaction_stage: nil)
      item.valid?
      expect(item.errors[:transaction_stage]).to include("can't be blank")
    end

    it "is invalid without a like_count" do
      item = build(:item, like_count: nil)
      item.valid?
      expect(item.errors[:like_count]).to include("can't be blank")
    end

    it "is invalid without a size_id" do
      item = build(:item, size_id: nil)
      item.valid?
      expect(item.errors[:size_id]).to include("can't be blank")
    end

    it "is invalid without a brand_id" do
      item = build(:item, brand_id: nil)
      item.valid?
      expect(item.errors[:brand_id]).to include("can't be blank")
    end

    it "is invalid without a upper_category_id" do
      item = build(:item, upper_category_id: nil)
      item.valid?
      expect(item.errors[:upper_category_id]).to include("can't be blank")
    end

    it "is invalid without a middle_category_id" do
      item = build(:item, middle_category_id: nil)
      item.valid?
      expect(item.errors[:middle_category_id]).to include("can't be blank")
    end

    it "is invalid without a lower_category_id" do
      item = build(:item, lower_category_id: nil)
      item.valid?
      expect(item.errors[:lower_category_id]).to include("can't be blank")
    end

    it "is invalid without a seller_id" do
      item = build(:item, seller_id: nil)
      item.valid?
      expect(item.errors[:seller_id]).to include("can't be blank")
    end

    it "is invalid without a buyer_id" do
      item = build(:item, buyer_id: nil)
      item.valid?
      expect(item.errors[:buyer_id]).to include("can't be blank")
    end

    it "is invalid without a created_at" do
      item = build(:item, created_at: nil)
      item.valid?
      expect(item.errors[:created_at]).to include("can't be blank")
    end

    it "is invalid without a updated_at" do
      item = build(:item, updated_at: nil)
      item.valid?
      expect(item.errors[:updated_at]).to include("can't be blank")
    end
  end
end
