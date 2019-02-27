class BookingsController < ApplicationController
  before_action :set_animal
  def new
    @booking = Booking.new

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.animal = @animal
    @booking.user = current.user

    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:animal_id, :user_id, :start_date, :end_date)
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
end
