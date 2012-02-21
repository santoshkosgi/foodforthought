class HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end

  def show

    @hotel = Hotel.find(params[:id])
    @fooditem = @hotel.fooditems

  end

  def new
    @hotel = Hotel.new
  end

  def edit
    @hotel = Hotel.find(params[:id])

  end

  def create
    @hotel = Hotel.new(params[:hotel])

      if @hotel.save
         redirect_to :controller => "hotels", :action => "index"
      else
         render :action => "new"
      end
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update_attributes(params[:hotel])
         redirect_to :controller => "hotels", :action => "index"
      else
         render :controller => "hotels",:action => "edit", :id => @hotel
      end
  end

  def destroy

    @hotel = Hotel.find(params[:id])
    @hotel.destroy

       redirect_to hotels_url
  end
end
