class Trip < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings
  mount_uploader :photo, PhotoUploader

end
