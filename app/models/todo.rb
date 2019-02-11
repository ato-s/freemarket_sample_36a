class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :item

  enum todo_stage: {
    ship_it: 1,
    review_if_buyer_received: 2,
    review_and_receive_money: 3
  }
end
