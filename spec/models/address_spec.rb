require 'rails_helper'

describe Address do
  describe '#create' do
    it "is invalid without a first_name" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end
    it "is invalid without a last_name" do
      address = build(:address, last_name: "")
      address.valid?
      expect(address.errors[:last_name]).to include("can't be blank")
    end
    it "is invalid without a postal_code" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end
    it "is invalid if postal_code is not 7 characters" do
      address = build(:address, postal_code: "00000000")
      address.valid?
      expect(address.errors[:postal_code]).to include("is the wrong length (should be 7 characters)")
    end
    it "is invalid without a city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
    it "is invalid without a address" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end
    it "is invalid without a user_id" do
      address = build(:address, user_id: "")
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a first_name_katakana" do
      address = build(:address, first_name_katakana: "")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("can't be blank")
    end
    it "is invalid if first_name_katakana is hiragana" do
      address = build(:address, first_name_katakana: "あいうえお")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid if first_name_katakana is kanji" do
      address = build(:address, first_name_katakana: "亜衣卯江御")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid if first_name_katakana is alphabet" do
      address = build(:address, first_name_katakana: "aiueo")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid if first_name_katakana is number" do
      address = build(:address, first_name_katakana: "12345")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("はカタカナで入力して下さい。")
    end

    it "is invalid without a last_name_katakana" do
      address = build(:address, last_name_katakana: "")
      address.valid?
      expect(address.errors[:last_name_katakana]).to include("can't be blank")
    end
    it "is invalid if last_name_katakana is hiragana" do
      address = build(:address, last_name_katakana: "あいうえお")
      address.valid?
      expect(address.errors[:last_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid if last_name_katakana is kanji" do
      address = build(:address, last_name_katakana: "亜衣卯江御")
      address.valid?
      expect(address.errors[:last_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid if last_name_katakana is alphabet" do
      address = build(:address, last_name_katakana: "aiueo")
      address.valid?
      expect(address.errors[:last_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is invalid if last_name_katakana is number" do
      address = build(:address, last_name_katakana: "12345")
      address.valid?
      expect(address.errors[:last_name_katakana]).to include("はカタカナで入力して下さい。")
    end
    it "is associated with devise_user" do
      user = create(:devise_user)
      address = create(:address, user: user)
      address.valid?
      expect(address.errors.messages).to include({})
    end
    it "is associated with api_user" do
      user = create(:api_user)
      address = create(:address, user: user)
      address.valid?
      expect(address.errors.messages).to include({})
    end
  end
end