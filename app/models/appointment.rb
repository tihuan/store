require "#{Rails.root}/lib/money_attributes"

class Appointment < ActiveRecord::Base
  include MoneyAttributes
  money_attributes :price

  belongs_to :account
  belongs_to :service

end
