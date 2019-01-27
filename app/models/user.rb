class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2 instagram]

  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
  has_many :sent_reviews, class_name: 'Review', foreign_key: 'appraiser_id'
  has_many :received_reviews, class_name: 'Review', foreign_key: 'appraisee_id'
  has_many :reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :transaction_messages, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :avatars, dependent: :destroy, inverse_of: :user
  has_many :credits,dependent: :destroy
  has_one :mypage, dependent: :destroy, inverse_of: :user
  has_one :phone_number, dependent: :destroy
  accepts_nested_attributes_for :mypage, allow_destroy: true
  accepts_nested_attributes_for :avatars, allow_destroy: true

  validates :nickname, presence: true, uniqueness: true, length: { in: 3..14 }, if: :nickname_required?
  validates :good_count, :normal_count, :bad_count, presence: true


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
    end
  end
  def email_required?
    (provider.blank? || !email.blank?) && super
  end
  def nickname_required?
    (provider.blank? || !nickname.blank?)
  end
  def password_required?
    (provider.blank? || !password.blank?) && super
  end
end
