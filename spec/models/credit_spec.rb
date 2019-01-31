require 'rails_helper'

describe "Credit" do
  describe '#create' do

#credi_number,limit_month,limit_year,security_code,customer_id,user_idが存在すれば登録できる
    it "is valid with a credit_number,limit_month,limit_year,security_code,customer_id,user_id" do
      user = build(:user)
      credit = build(:credit)
      expect(credit).to be_valid
    end

#credit_numberが空だと登録出来ない
    it "is invalid without a credit_number" do
      credit = build(:credit, credit_number: nil)
      credit.valid?
      expect(credit.errors[:credit_number]).to include("can't be blank")
    end

#limit_monthが空だと登録出来ない
    it "is invalid without a limit_year" do
      credit = build(:credit, limit_month: nil)
      credit.valid?
      expect(credit.errors[:limit_month]).to include("can't be blank")
    end

#limit_yearが空だと登録出来ない
    it "is invalid without a limit_year" do
      credit = build(:credit, limit_year: nil)
      credit.valid?
      expect(credit.errors[:limit_year]).to include("can't be blank")
    end

#security_codeが空だと登録出来ない
    it "is invalid without a security_code" do
      credit = build(:credit, security_code: nil)
      credit.valid?
      expect(credit.errors[:security_code]).to include("can't be blank")
    end

#customer_idが空だと登録出来ない
    it "is invalid without a customer_id" do
      credit = build(:credit, customer_id: nil)
      credit.valid?
      expect(credit.errors[:customer_id]).to include("can't be blank")
    end

#user_idが空だと登録出来ない
    it "is invalid without a user_id" do
      credit = build(:credit, user_id: nil)
      credit.valid?
      expect(credit.errors[:user_id]).to include("can't be blank")
    end

#重複したcredit_numberがあると登録出来ない
   it "is invalid with a duplicate credit_number" do
      credit = create(:credit)
      another_credit_num = build(:credit, credit_number: credit.credit_number)
      another_credit_num.valid?
      expect(another_credit_num.errors[:credit_number]).to include("has already been taken")
    end

#重複したcustomer_idがあると登録出来ない
   it "is invalid with a duplicate customer_id" do
      credit = create(:credit)
      another_customer_id = build(:credit, customer_id: credit.customer_id)
      another_customer_id.valid?
      expect(another_customer_id.errors[:customer_id]).to include("has already been taken")
    end

  end
end
