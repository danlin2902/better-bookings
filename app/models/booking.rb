class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :reviews

  validates :trip, presence: true

end
