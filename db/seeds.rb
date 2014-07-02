require 'faker'

ActiveRecord::Base.transaction do
  5.times do
      Account.create(
        fname: Faker::Name.first_name,
        lname: Faker::Name.last_name,
        address: Faker::Address.street_address,
        phone: Faker::PhoneNumber.phone_number,
        birthdate: Faker::Business.credit_card_expiry_date,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        memo: Faker::Company.bs
      )
  end
end
