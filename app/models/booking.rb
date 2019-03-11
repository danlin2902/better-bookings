class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :reviews
end
