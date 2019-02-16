class Report < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, :item_id, :report_type, presence: true
end
