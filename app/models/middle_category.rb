class MiddleCategory < ApplicationRecord
  belongs_to :upper_category
  belongs_to :size_type
  has_many :lower_categories
  has_many :items
end
