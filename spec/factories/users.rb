FactoryBot.define do

  factory :user do
    id                 {"1"}
    email              {"aaaa@aaaa"}
    encrypted_password {"aaaaaaaa"}
    nickname           {"aaaa"}
    uid                {"1"}
    provider           {"aaaa"}
    good_count         {"0"}
    normal_count       {"0"}
    bad_count          {"0"}
    sign_in_count      {"0"}
    failed_attempts    {"0"}

  end

end
