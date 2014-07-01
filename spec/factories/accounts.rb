# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do |a|
    a.fname { Faker::Name.first_name }
    a.lname { Faker::Name.last_name }
  end
end
