class Picture < ApplicationRecord
  # belongs_to :item, optional: true
  # validates :content, :status, presence: true
  mount_uploader :content, ImageUploader
  belongs_to :item
  validates :content, :status, presence: true
  validates :item_id, presence: true, on: :update

end
