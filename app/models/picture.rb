class Picture < ApplicationRecord
  belongs_to :item
  validates :content, :status, presence: true
  validates :item_id, presence: true, on: :update
  mount_uploader :content, ImageUploader

  attr_accessor :trriming_x
  attr_accessor :trriming_y
  attr_accessor :trriming_width
  attr_accessor :trriming_height
end
