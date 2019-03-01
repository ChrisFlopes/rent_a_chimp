class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = policy_scope(Animal).where.not(latitude: nil, longitude: nil)

    if params[:query].present?
      sql_query = " \
        animals.species @@ :query \
        OR animals.address @@ :query \
      "
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%")

    else
      @animals = Animal.all
    end

    @markers = @animals.map do |animal|
      {
        lng: animal.longitude,
        lat: animal.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { animal: animal }),
        image_url: helpers.asset_url('chimp-face-of-brazil.png')
      }
    end
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.owner = current_user
    authorize @animal
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def show
    authorize @animal
    @review = Review.new
  end

  def edit
    authorize @animal
  end

  def update
    authorize @animal
    if @animal.update(animal_params)
      redirect_to animal_path
    else
      render :edit
    end
  end

  def destroy
    authorize @animal
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :age, :species, :owner_id, :photo)
  end
end
