class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :text, :user_id, :item_id, presence: true
end
