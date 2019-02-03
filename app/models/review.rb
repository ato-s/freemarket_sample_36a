class Review < ApplicationRecord
  belongs_to :item
  belongs_to :appraiser, class_name: 'User', foreign_key: 'appraiser_id'
  belongs_to :appraisee, class_name: 'User', foreign_key: 'appraisee_id'

  validates :text, :evaluation, :item_id, :appraisee_id, :appraiser_id, presence: true

  enum evaluation: {
    good: 1,
    normal: 2,
    bad: 3
  }
end
