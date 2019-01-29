class Item < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id', optional: true
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :upper_category, optional: true
  belongs_to :middle_category, optional: true
  belongs_to :lower_category, optional: true

  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :transaction_messages, dependent: :destroy
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  # , reject_if: :reject_pictures, allow_destroy: true

  # validates :name, :description, :state, :delivery_payer, :delivery_region, :delivery_duration, :buy_price, :sell_price, :commission_price, :transaction_stage, :like_count, presence: true
end
