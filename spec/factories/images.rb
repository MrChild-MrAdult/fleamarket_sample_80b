FactoryBot.define do
  factory :image do
    url {File.open("#{Rails.root}/public/images/kumano_umi.jpeg")}
  end
end