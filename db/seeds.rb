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

      Service.create(
        name: Faker::Commerce.product_name,
        price_in_cents: Faker::Address.building_number
      )

      Appointment.create(
        date: Faker::Business.credit_card_expiry_date,
        hour: '1200',
        account_id: rand(2),
        service_id: rand(2),
      )
  end
end
