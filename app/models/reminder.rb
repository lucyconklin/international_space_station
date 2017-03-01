class Reminder < ApplicationRecord
  validates :timestamp, presence: true
  validates :phone_number, presence: true
end
