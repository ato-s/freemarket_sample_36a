FactoryBot.define do

  factory :user do

    id                 {"1"}
    email              Faker::Internet.email
    encrypted_password Faker::Internet.password(8)
    nickname           Faker::Name.name
    uid                {"1"}
    provider           {"aaaa"}
    good_count         Faker::Number.number(2)
    normal_count       Faker::Number.number(2)
    bad_count          Faker::Number.number(2)
    sign_in_count      Faker::Number.number(2)
    failed_attempts    {"0"}

  end

end
