class Picture < ApplicationRecord
  belongs_to :item
  validates :content, :status, presence: true
  validates :item_id, presence: true, on: :update
end
