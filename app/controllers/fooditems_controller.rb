class FooditemsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @fooditem = @hotel.fooditems.create(params[:fooditem])
    redirect_to hotel_path(@hotel)
  end

  def show
    @fooditem = Fooditem.find(params[:id])
  end

end
