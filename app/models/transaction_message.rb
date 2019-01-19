class TransactionMessage < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :text, :item_id, :user_id, presence: true
end
