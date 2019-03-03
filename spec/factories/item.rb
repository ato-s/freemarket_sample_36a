FactoryBot.define do
  factory :item do
    id                    "1"
    name                  "iphoneケーブル"
    description           "iphoneを買った時の付属品です。"
    state                 "perfectly_new"
    delivery_payer        "seller"
    delivery_region       "北海道"
    delivery_duration     "one_to_two_days"
    buy_price             "1000"
    sell_price            "900"
    commission_price      "100"
    transaction_stage     "under_sale"
    like_count            "0"
    size_id               "1"
    brand_id              "1"
    upper_category_id     "1"
    middle_category_id    "1"
    lower_category_id     "1"
    seller_id             "2"
    buyer_id              "1"
    created_at            "2019-1-12 10:00:00"
    updated_at            "2019-1-12 10:00:00"
  end

  factory :brand do
    id            "1"
    name          "ロレックス"
    initial_word  "aaa"
  end

  factory :size_type do
    id            "1"
    size_type          "size"
  end

  factory :size do
    id            "1"
    name          "XXS以下"
    size_type_id "1"
  end

  factory :lower_category do
    id            "1"
    name          "Tシャツ/カットソー(半袖/袖なし)"
    middle_category_id  "1"
  end

  factory :middle_category do
    id            "1"
    name          "トップス"
    upper_category_id  "1"
    size_type_id   "1"
  end

  factory :upper_category do
    id            "1"
    name          "レディース"
  end

  factory :information do
    id            "1"
    information_type          ""
    text         ""
    originally_price  "0"
    changed_price  "0"
    point  "0"
    stakeholder_id  "1"
    related_item_id  "1"
    created_review_id  ""
    unread_or_read  "unread"
  end

  factory :user_information do
    id            "1"
    user_id  "1"
    information_id "1"
  end

end

