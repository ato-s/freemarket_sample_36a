class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
         # , :omniauthable, omniauth_providers: [:twitter]

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

  validates :nickname, presence: true, uniqueness: true, length: { in: 3..14 }
  validates :good_count, :normal_count, :bad_count, presence: true
end
