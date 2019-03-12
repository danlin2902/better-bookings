class Trip < ApplicationRecord
  has_many :users, through: :bookings

  mount_uploader :photo, PhotoUploader

end
