class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

  validates :nickname, presence: true, uniqueness: true
end
