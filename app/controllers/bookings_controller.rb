class BookingsController < ApplicationController
    before_action :find_bookings, only: [ :show ]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @booking = Booking.new
    # @booking.trip = @trip
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.trip = Trip.find(params[:trip_id])
    if @booking.save
      redirect_to trip_booking_url(@booking.trip, @booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :trip_id)
  end

  def find_bookings
    @booking = Booking.where("user_id = current_user")
  end
end
