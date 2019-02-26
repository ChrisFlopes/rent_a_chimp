class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show]

  def index
    @animals = Animal.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :age, :species, :owner_id)
  end
end
