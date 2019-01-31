class Mypage < ApplicationRecord
  belongs_to :user, inverse_of: :mypage, optional: true

  validates :profile, :user_id, presence: true, on: :update
end
