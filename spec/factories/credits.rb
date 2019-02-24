FactoryBot.define do

  factory :credit do
    credit_number  {"4242424242424242"}
    limit_month    {"12"}
    limit_year     {"29"}
    security_code  {"123"}
    customer_id    {"cus_b8ee086801a5b26badf7e06dc935"}
    user_id        {"1"}
    created_at     {"2019-1-12 10:00:00"}
    updated_at     {"2019-1-12 10:00:00"}
  end

end
