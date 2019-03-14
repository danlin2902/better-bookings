class AddTripRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :trip, foreign_key: true
  end
end
