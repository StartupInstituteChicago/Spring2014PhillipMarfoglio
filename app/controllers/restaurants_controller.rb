class RestaurantsController < ApplicationController

  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant].permit(:name, :description, :address, :phone_number))
    
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def update
  	@restaurant = Restaurant.find(params[:id])

  	if @restaurant.update(params[:restaurant].permit(:name, :description, :address, :phone_number))
  	  redirect_to @restaurant
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@restaurant = Restaurant.find(params[:id])
  	@restaurant.destroy

  	redirect_to restaurants_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :phone_number)
    end  
end