class PhoneNumber < ApplicationRecord
  belongs_to :user
  validates :number, :verified, :user_id, presence: true
  validates :verified, inclusion: { in: [true, false] }
end
