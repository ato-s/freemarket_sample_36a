require 'rails_helper'

describe User do
  describe '#create' do
    it "devise_user is invalid without a email" do
      user = build(:devise_user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "devise_user is invalid if email already exist" do
      user2 = create(:devise_user, nickname: "test_user2")
      user = build(:devise_user)
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
    it "devise_user is invalid if email format is not correct" do
      user = build(:devise_user, email: "test")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "devise_user is invalid without a nickname" do
      user = build(:devise_user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "devise_user is invalid if nickname already exist" do
      user2 = create(:devise_user, email: "test_user2@gmail.com")
      user = build(:devise_user)
      user.valid?
      expect(user.errors[:nickname]).to include("has already been taken")
    end
    it "devise_user is invalid if nickname is too short" do
      user = build(:devise_user, nickname: "a")
      user.valid?
      expect(user.errors[:nickname]).to include("is too short (minimum is 3 characters)")
    end
    it "devise_user is invalid if nickname is too long" do
      user = build(:devise_user, nickname: "aaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 14 characters)")
    end

    it "devise_user is invalid without a password" do
      user = build(:devise_user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "devise_user is invalid if password is too short" do
      user = build(:devise_user, password: "a")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
    it "devise_user is invalid without a password_confirmation" do
      user = build(:devise_user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "devise_user is invalid if password and password_confirmation are different" do
      user = build(:devise_user, password: "00000000", password_confirmation: "00000001")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "api_user is invalid without a uid" do
      user = build(:api_user, uid: "")
      user.valid?
      expect(user.errors[:uid]).to include("can't be blank")
    end
    it "api_user is invalid without a provider" do
      user = build(:api_user, provider: "")
      user.valid?
      expect(user.errors[:provider]).to include("can't be blank")
    end
    it "api_user is invalid if provider is not match in list" do
      user = build(:api_user, provider: "line")
      user.valid?
      expect(user.errors[:provider]).to include("is not included in the list")
    end
  end
end
