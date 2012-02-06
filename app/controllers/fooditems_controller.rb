class FooditemsController < ApplicationController

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @fooditem = @hotel.fooditems.create(params[:fooditem])
    redirect_to hotel_path(@hotel)
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @fooditem = @hotel.fooditems.find(params[:id])
  end

  def new
  @hotel=Hotel.find(params[:hotel_id])
  @fooditem = @hotel.fooditems.new
  end

  def edit
   @hotel = Hotel.find(params[:hotel_id])
   @fooditem = @hotel.fooditems.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @fooditem = @hotel.fooditems.create(params[:fooditem])
    if @fooditem.update_attributes(params[:fooditem])
      redirect_to hotel_path(@hotel)
    else
         render edit_fooditem_path(@fooditem)
    end
  end

  def destroy

    @hotel = Hotel.find(params[:hotel_id])
    @fooditem = @hotel.fooditems.find(params[:id])
    @fooditem.destroy
    redirect_to post_path(@hotel)
  end
end
