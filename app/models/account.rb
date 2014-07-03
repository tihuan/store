class Account < ActiveRecord::Base
  has_secure_password

  has_many :appointments
  has_many :services, through: :appointments
end
