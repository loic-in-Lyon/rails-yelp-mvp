class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

# RestaurantsController
#   GET index
#     routes to #index (FAILED - 11)
#     assigns all restaurants as @restaurants (FAILED - 12)
#   GET show
#     routes to #show (FAILED - 13)
#     assigns the requested restaurant as @restaurant (FAILED - 14)
#   GET new
#     routes to #new (FAILED - 15)
#     assigns a new restaurant as @restaurant (FAILED - 16)
#   POST create
#     routes to #create (FAILED - 17)
#     with valid params
#       creates a new Restaurant (FAILED - 18)
#       assigns a newly created restaurant as @restaurant (FAILED - 19)
#       redirects to the created restaurant (FAILED - 20)
#     with invalid params
#       assigns a newly created but unsaved restaurant as @restaurant (FAILED - 21)
#       re-renders the 'new' template (FAILED - 22)
