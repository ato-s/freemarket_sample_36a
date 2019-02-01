require 'rails_helper'

describe "Credit" do
  describe '#create' do

    it "is valid with a credit_number,limit_month,limit_year,security_code,customer_id,user_id" do
      user = create(:user)
      credit = build(:credit)
      expect(credit).to be_valid
    end

    it "is invalid without a credit_number" do
      usr = create(:user)
      credit = build(:credit, credit_number: nil)
      credit.valid?
      expect(credit.errors[:credit_number]).to include("can't be blank")
    end

    it "is invalid without a limit_year" do
      usr = create(:user)
      credit = build(:credit, limit_month: nil)
      credit.valid?
      expect(credit.errors[:limit_month]).to include("can't be blank")
    end

    it "is invalid without a limit_year" do
      usr = create(:user)
      credit = build(:credit, limit_year: nil)
      credit.valid?
      expect(credit.errors[:limit_year]).to include("can't be blank")
    end

    it "is invalid without a security_code" do
      usr = create(:user)
      credit = build(:credit, security_code: nil)
      credit.valid?
      expect(credit.errors[:security_code]).to include("can't be blank")
    end

    it "is invalid without a customer_id" do
      usr = create(:user)
      credit = build(:credit, customer_id: nil)
      credit.valid?
      expect(credit.errors[:customer_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      usr = create(:user)
      credit = build(:credit, user_id: nil)
      credit.valid?
      expect(credit.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid with a duplicate credit_number" do
      usr = create(:user)
      another_user = create(:user,id: 2,email: "test_user_2@gmail.com",nickname: "test_user_2")
      credit = create(:credit)
      another_credit = build(:credit,user_id: 2)
      another_credit.valid?
      expect(another_credit.errors[:credit_number]).to include("has already been taken")
    end

    it "is invalid with a duplicate customer_id" do
      usr = create(:user)
      another_user = create(:user,id: 2,email: "test_user_2@gmail.com",nickname: "test_user_2")
      credit = create(:credit)
      another_credit = build(:credit,user_id: 2)
      another_credit.valid?
      expect(another_credit.errors[:customer_id]).to include("has already been taken")
    end
  end
end
