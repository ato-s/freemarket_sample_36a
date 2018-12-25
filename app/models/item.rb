class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :size
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :upper_category
  belongs_to :middle_category
  belongs_to :lower_category

  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :transaction_messages, dependent: :destroy
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :reject_pictures, allow_destroy: true

  validates :name, :description, :state, :delivery_payer, :delivery_region, :delivery_duration, :buy_price, :sell_price, :commission_price, :transaction_stage, :like_count, presence: true
end
