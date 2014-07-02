# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do |a|
    a.fname { Faker::Name.first_name }
    a.lname { Faker::Name.last_name }
    a.address { Faker::Address.street_address }
    a.phone { Faker::PhoneNumber.phone_number }
    a.birthdate { Faker::Business.credit_card_expiry_date }
    a.email { Faker::Internet.email }
    a.password { Faker::Internet.password }
    a.memo { Faker::Company.bs }
  end
end
