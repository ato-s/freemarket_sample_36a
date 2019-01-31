FactoryBot.define do

  factory :credit do
    id              {"1"}
    credit_number   Faker::Number.number(16)
    limit_month     {"12"}
    limit_year      {"29"}
    security_code   {"123"}
    customer_id     {"cus_00000000000000000"}
    user_id         {"1"}
  end

end
