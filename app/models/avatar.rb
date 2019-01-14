class Avatar < ApplicationRecord
  belongs_to :user, inverse_of: :avatars, optional: true

  validates :content, :status, :user_id, presence: true, on: :update
end
