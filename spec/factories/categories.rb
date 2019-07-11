FactoryBot.define do
  factory :category do
    title {Faker::Food.dish}
  end
end
