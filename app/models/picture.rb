class Picture < ApplicationRecord
  belongs_to :item
  validates :content, :status, :item_id, presence: true
end
