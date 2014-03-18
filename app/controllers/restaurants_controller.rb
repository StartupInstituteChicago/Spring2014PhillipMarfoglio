class RestaurantsController < ApplicationController
  before_filter :authenticate_owner!
  
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
    @restaurant = Restaurant.new(params[:restaurant].permit(:name, :description,
     :address, :phone_number))
    @restaurant.owner = current_owner

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
    owner_of_restaurant_check
  end

  def update
  	@restaurant = Restaurant.find(params[:id])
    if @restaurant.owner == current_owner
  	  if @restaurant.update(params[:restaurant].permit(:name, :description,
       :address, :phone_number, :photo))
  	    redirect_to @restaurant
  	  else
  	    render 'edit'
  	  end
    else
      flash[:notice] = "You do not own this restaurant!"
      redirect_to restaurants_path
    end
  end

  def destroy
  	@restaurant = Restaurant.find(params[:id])
  	@restaurant.destroy

  	redirect_to restaurants_path
  end

  def owner_of_restaurant_check
    if @restaurant.owner != current_owner
      flash[:notice] = "You do not own this restaurant!"
      redirect_to restaurants_path
    end
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :phone_number, :photo)
    end  
end
  