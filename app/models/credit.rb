class Credit < ApplicationRecord
  belongs_to :user

  validates :credit_number, presence: true, uniqueness: true
  validates :limit_month, presence: true, length: { is: 2 }
  validates :limit_year, presence: true, length: { is: 2 }
  validates :security_code, presence: true
  validates :customer_id, presence: true, uniqueness: true
  validates :user_id, presence: true

end
