FactoryBot.define do

  factory :address do
    first_name          "卓也"
    last_name           "寺元"
    first_name_katakana "タクヤ"
    last_name_katakana  "テラモト"
    postal_code         "0000000"
    prefecture          "大阪府"
    city                "大阪市"
    address             "1-2-3"
    building_name       "グランフロント"
    landline_number     "1234567890"
    user_id             "1"
  end
end