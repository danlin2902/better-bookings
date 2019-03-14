class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  validates :description, presence: true
end
