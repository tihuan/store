# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do |s|
    s.name { Faker::Commerce.product_name }
    s.price_in_cents { Faker::Address.building_number }
  end
end
