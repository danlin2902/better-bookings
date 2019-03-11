class Trip < ApplicationRecord
  has_many :users, through: :bookings
end
