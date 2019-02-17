class Picture < ApplicationRecord
  belongs_to :item
  validates :content, :status, presence: true
  validates :item_id, presence: true, on: :update
  mount_uploader :content, ImageUploader

  attr_accessor :image_x
  attr_accessor :image_y
  attr_accessor :image_w
  attr_accessor :image_h
end
