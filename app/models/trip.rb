class Trip < ApplicationRecord
  has_many :users, through: :bookings

  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?

  validates :name, presence: true
  validates :destination, presence: true
  validates :cost, presence: true
  validates :length, presence: true

  include PgSearch
  pg_search_scope :search_by_all,
  against: [ :name, :destination ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

end
