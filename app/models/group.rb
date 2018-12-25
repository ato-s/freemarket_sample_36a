class Group < ApplicationRecord
  has_many :brand_groups
  has_many :brands, through: :brand_groups
end
