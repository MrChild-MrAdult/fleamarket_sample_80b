FactoryBot.define do
  factory :product do
    name                  {"海の写真集"}
    description           {"美品です"}
    price                 {"1000"} 
    cost                  {"300"} 
    prefecture_id         {"2"} 
    delivery_day          {"1"}
    brand_id              {"3"}
    size                  {"2"}
    category_id           {"874"} 
    status                {"1"}
    images                { [build(:image)] } 
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
    association :category
    association :brand
  end
end