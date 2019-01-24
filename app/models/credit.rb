class Credit < ApplicationRecord
  belongs_to :user
  validates :customer_id, :user_id, presence: true
end
