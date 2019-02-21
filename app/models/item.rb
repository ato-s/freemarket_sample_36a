class Item < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id', optional: true
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id', optional: true
  belongs_to :upper_category, optional: true
  belongs_to :middle_category, optional: true
  belongs_to :lower_category, optional: true

  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  has_many :transaction_messages, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :information, class_name: 'Information', foreign_key: 'related_item_id'
  has_one :todo, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :name, :description, :state, :delivery_payer, :delivery_region, :delivery_duration, :buy_price, :sell_price, :commission_price, :transaction_stage, :like_count, :size_id, :brand_id, :upper_category_id, :middle_category_id, :lower_category_id, :seller_id, :buyer_id, :created_at, :updated_at, presence: true

  enum state: {
    perfectly_new: 1,
    almost_new: 2,
    no_noticeable_scratches_and_dirt: 3,
    slightly_scratchs_and_dirt: 4,
    scratched_and_dirt: 5,
    overall_bad_condition: 6
  }
  enum delivery_payer: {
    seller: 1,
    buyer: 2
  }
  enum delivery_region: {
    北海道: 1,
    青森県: 2,
    岩手県: 3,
    宮城県: 4,
    秋田県: 5,
    山形県: 6,
    福島県: 7,
    茨城県: 8,
    栃木県: 9,
    群馬県: 10,
    埼玉県: 11,
    千葉県: 12,
    東京都: 13,
    神奈川県: 14,
    新潟県: 15,
    富山県: 16,
    石川県: 17,
    福井県: 18,
    山梨県: 19,
    長野県: 20,
    岐阜県: 21,
    静岡県: 22,
    愛知県: 23,
    三重県: 24,
    滋賀県: 25,
    京都府: 26,
    大阪府: 27,
    兵庫県: 28,
    奈良県: 29,
    和歌山県: 30,
    鳥取県: 31,
    島根県: 32,
    岡山県: 33,
    広島県: 34,
    山口県: 35,
    徳島県: 36,
    香川県: 37,
    愛媛県: 38,
    高知県: 39,
    福岡県: 40,
    佐賀県: 41,
    長崎県: 42,
    熊本県: 43,
    大分県: 44,
    宮崎県: 45,
    鹿児島県: 46,
    沖縄県: 47,
    未定: 99
  }
  enum delivery_duration: {
    one_to_two_days: 1,
    two_to_three_days: 2,
    four_to_seven_days: 3
  }
  enum transaction_stage: {
    under_sale: 1,
    purchased: 2,
    shipping: 3,
    evaluated: 4,
    transaction_completed: 5
  }
end
