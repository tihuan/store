require "#{Rails.root}/lib/money_attributes"
class Appointment < ActiveRecord::Base
  include MoneyAttributes
  money_attributes :price
end
