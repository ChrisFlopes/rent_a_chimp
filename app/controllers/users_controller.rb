class UsersController < ApplicationController
  def index

  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
