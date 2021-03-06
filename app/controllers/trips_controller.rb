class TripsController < ApplicationController
  before_action :find_trips, only: [ :show ]
  def index
    if params[:query].present?
      @trips = Trip.near(params[:query], 500)
            @markers = @trips.map do |maptrip|
      {
        lng: maptrip.longitude,
        lat: maptrip.latitude,
        infoWindow: render_to_string(partial: "/trips/map_box", locals: { trip: maptrip })
      }
      end
    elsif params[:search][:query].present?
      @trips = Trip.near(params[:search][:query], 500)
      @markers = @trips.map do |maptrip|
        {
          lng: maptrip.longitude,
          lat: maptrip.latitude,
          infoWindow: render_to_string(partial: "/trips/map_box", locals: { trip: maptrip })
        }
      end
    else
      @trips = Trip.all
      @markers = @trips.map do |maptrip|
      {
        lng: maptrip.longitude,
        lat: maptrip.latitude,
        infoWindow: render_to_string(partial: "/trips/map_box", locals: { trip: maptrip })
      }
    end

    # @maptrips = Trip.where.not(latitude: nil, longitude: nil)


    # @markers = @maptrips.map do |maptrip|
    #   {
    #     lng: maptrip.longitude,
    #     lat: maptrip.latitude,
    #     infoWindow: render_to_string(partial: "/trips/map_box", locals: { trip: maptrip })
    #   }
    end
  end

  def dashboard
    @trips = Trip.where(user: current_user)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :length, :cost, :destination, :photo)
  end

  def find_trips
    @trip = Trip.find(params[:id])
  end
end
