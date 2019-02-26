class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :new, :create, :update, :destroy]

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @animal = animal.update(animal_params)

    redirect_to animal_path
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :age, :species, :owner_id)
  end
end
