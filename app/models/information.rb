class Information < ApplicationRecord
  has_many :user_informations, dependent: :destroy
  has_many :users, through: :user_informations, dependent: :destroy

  belongs_to :stakeholder, class_name: 'User', foreign_key: 'stakeholder_id', optional: true
  belongs_to :related_item, class_name: 'Item', foreign_key: 'related_item_id', optional: true

  enum information_type: {
    admin_information: 1,
    be_liked: 2,
    to_like: 3,
    to_exhibit: 4,
    to_purchase: 5,
    be_purchased: 6,
    to_ship: 7,
    be_shiped: 8,
    to_evaluate: 9,
    be_evaluated: 10,
    to_comment: 11,
    be_commented: 12,
    send_transaction_message: 13,
    recievied_transaction_messaged: 14,
    to_discount: 15,
    be_discounted: 16,
    be_sold_out: 17,
    transaction_has_been_finished: 18
  }
  enum unread_or_read: {
    unread: false,
    read: true
  }
end
