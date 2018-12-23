class Picture < ApplicationRecord
  belongs_to :item
  validates :content, :status, presence: true
end
