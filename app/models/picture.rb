class Picture < ApplicationRecord
  belongs_to :item, optional: true
  # validates :content, :status, presence: true
  mount_uploader :content, ImageUploader
end
