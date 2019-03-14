class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :trip

  validates :description, presence: true
end
