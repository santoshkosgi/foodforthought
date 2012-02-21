class FooditemsController < ApplicationController

  def index
    @hotel = Hotel.find(params[:hotel])
    @fooditem = @hotel.fooditems.all
  end

  def create
    @fooditem = Fooditem.new(params[:fooditem])
    if @fooditem.save(params[:fooditem])
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @fooditem = Fooditem.find(params[:id])
    @hotel = @fooditem.hotel
  end

  def new
    #@hotel=Hotel.find(params[:hotel_id])
    @fooditem = Fooditem.new
    if params[:id]
      @hotel=Hotel.find(params[:id])
    end
  end

  def list
    @fooditems = Hotel.find(params[:id]).fooditems
  end

  def edit
    @fooditem = Fooditem.find(params[:id])
    @hotel = @fooditem.hotel
  end

  def update
    @fooditem = Fooditem.find(params[:id])
    @hotel = @fooditem.hotel
    if @fooditem.update_attributes(params[:fooditem])
      redirect_to hotel_path(@hotel)
    else
         render edit_fooditem_path(@fooditem)
    end
  end

  def destroy

    @fooditem = Fooditem.find(params[:id])
    @hotel = @fooditem.hotel
    @fooditem.destroy
    redirect_to hotel_path(@hotel)

  end
end
