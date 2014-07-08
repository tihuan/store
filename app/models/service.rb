require "money_attributes"
class Service < ActiveRecord::Base
  include MoneyAttributes
  money_attributes :price

  has_many :appointments
  has_many :accounts, through: :appointments
end
