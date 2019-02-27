class BookingsController < ApplicationController
  before_action :set_animal
  before_action :set_user

  def new
    @booking = Booking.new

    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.animal = @animal
    @booking.user = current_user

    if @booking.save
      redirect_to animals_path # change to users profile with list of bookings as soon as it exists
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

  def set_user
    @user = current_user
  end
end
