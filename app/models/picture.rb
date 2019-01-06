class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item
  validates :content, :status, presence: true
end
