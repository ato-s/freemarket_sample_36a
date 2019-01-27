FactoryBot.define do
  factory :item do
    name                  "iphoneケーブル"
    description           "iphoneを買った時の付属品です。"
    state                 "1"
    delivery_payer        "2"
    delivery_region       "27"
    delivery_duration     "1"
    buy_price             "1000"
    sell_price            "900"
    commission_price      "100"
    transaction_stage     ""
    like_count            "0"
    size_id               "0"
    brand_id              "0"
    upper_category_id     "0"
    middle_category_id    "0"
    lower_category_id     "0"
    seller_id             "1"
    buyer_id              "2"
    created_at            "2019-1-12 10:00:00"
    updated_at            "2019-1-12 10:00:00"
  end
end