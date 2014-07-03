require "#{Rails.root}/lib/money_attributes"

class Appointment < ActiveRecord::Base
  include MoneyAttributes
  money_attributes :price

  belongs_to :account
  belongs_to :service

  validates :date, presence: true
  validates :hour, presence: true
end
