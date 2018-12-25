class UpperCategory < ApplicationRecord
  has_many :middle_categories
  has_many :items
end
