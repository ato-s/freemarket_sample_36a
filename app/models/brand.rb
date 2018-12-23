class Brand < ApplicationRecord
  has_many :items
  has_many :brand_groups
  has_many :groups, through: :brand_groups
end
