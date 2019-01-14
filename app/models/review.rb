class Review < ApplicationRecord
  belongs_to :item
  belongs_to :appraiser, class_name: 'User', foreign_key: 'appraiser_id'
  belongs_to :appraisee, class_name: 'User', foreign_key: 'appraisee_id'

  validates :text, :evaluation, presence: true
end
