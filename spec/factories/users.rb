FactoryBot.define do
  factory :user do
    family_name           {"先島"}
    first_name            {"光"}
    family_name_kana      {"サキシマ"}
    first_name_kana       {"ヒカリ"}
    nickname              {"ひーくん"}
    # email                 {"shiodome@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birth_day             {"2000/10/27"}
    user_img              {""}
    introduction          {""}
    sequence(:email) {Faker::Internet.email}
  end
end