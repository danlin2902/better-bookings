class TripsController < ApplicationController
  before_action :find_trips, only: [ :show ]
  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:length, :cost, :destination)
  end

  def find_trips
    @trip = Trip.find(params[:id])
  end
end
