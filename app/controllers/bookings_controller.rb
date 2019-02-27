class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @booking = Booking.new

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.animal = @animal
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:review).permit(:animal_id, :user_id, :start_date, :end_date)
  end
end
