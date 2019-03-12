class Trip < ApplicationRecord
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :destination, presence: true
  validates :cost, presence: true
  validates :length, presence: true

  mount_uploader :photo, PhotoUploader
end
