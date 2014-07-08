class Appointment < ActiveRecord::Base
  belongs_to :account
  belongs_to :service

  validates :date, presence: true
  validates :hour, presence: true
end
