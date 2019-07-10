FactoryBot.define do
    factory :product do
      title  {Faker::Food.dish}
      price {120}
    end
  end