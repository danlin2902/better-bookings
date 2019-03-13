class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @trip = Trip.all.sample(12)
  end
end
