class BookingsController < ApplicationController
    before_action :find_bookings, only: [ :show ]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    @trip = Trip.new
    # @booking.trip = @trip
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.trip = Trip.find(params[:booking][:trip_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :trip_id)
  end

  def find_bookings
    @booking = Booking.find(params[:id])
  end
end
