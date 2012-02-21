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

  def add_photo
     render :layout => nil
  end

  def add_photo1
     render :layout => nil
     uri = URI('http://api.flickr.com/services/rest/')
     param = { :method => 'flickr.photos.search', :api_key =>"b918d8ee76b61763671fedc99130696a",
                :text =>params[:name], :format =>"rest"}
     uri.query = URI.encode_www_form(param)
     res = Net::HTTP.get_response(uri)
     puts res.body
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
