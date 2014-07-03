class Service < ActiveRecord::Base
  has_many :appointments
  has_many :accounts, through: :appointments
end
