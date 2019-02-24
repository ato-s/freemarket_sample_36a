FactoryBot.define do

  factory :devise_user, class: User do
    email                 "test_user@gmail.com"
    nickname              "test_user"
    uid                   ""
    provider              ""
    good_count            "0"
    normal_count          "0"
    bad_count             "0"
    created_at            ""
    updated_at            ""
    password              "00000000"
    password_confirmation "00000000"
  end

  factory :api_user, class: User do
    email                 ""
    nickname              ""
    uid                   "uid"
    provider              "instagram"
    good_count            "0"
    normal_count          "0"
    bad_count             "0"
    created_at            ""
    updated_at            ""
    password              "00000000"
    password_confirmation "00000000"
  end

  factory :user do
    id                    {"1"}
    email                 {"test_user@gmail.com"}
    nickname              {"test_user"}
    uid                   {""}
    provider              {""}
    good_count            {"0"}
    normal_count          {"0"}
    bad_count             {"0"}
    created_at            {""}
    updated_at            {""}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

  factory :user_seller do
    id                    {"2"}
    email                 {"test_user2@gmail.com"}
    nickname              {"test_user2"}
    uid                   {""}
    provider              {""}
    good_count            {"0"}
    normal_count          {"0"}
    bad_count             {"0"}
    created_at            {""}
    updated_at            {""}
    password              {"11111111"}
    password_confirmation {"11111111"}
  end

end
