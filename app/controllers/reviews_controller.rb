class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @trip = Trip.find(params["trip_id"])
    @review.trip = @trip
    @review.user = current_user
    if @review.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
