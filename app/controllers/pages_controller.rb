class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  @first_time = true

  def home
    if params[:search].present?
      @trip = Trip.where("destination LIKE ?", "%#{params[:search][:query]}%")
    else
      @trip = Trip.all.sample(12)
   end
  end

  def search

  end
end
