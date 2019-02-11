class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :item

  enum information_type: {
    ship_it: 1,
    has_been_shiped: 2,
    buyer_review: 3,
    seller_review: 4
  }
end
