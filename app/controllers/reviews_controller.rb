class ReviewsController < ApplicationController
  before_action :set_user
  before_action :find_booking, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    if @review.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def uptdate
  end

  def destroy
  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_user
    @user = current_user
  end
end
