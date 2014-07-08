# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do |a|
    a.date { Faker::Business.credit_card_expiry_date }
    a.hour { '1200' }
    a.account_id { rand(2) }
    a.service_id { rand(2) }
  end
end
