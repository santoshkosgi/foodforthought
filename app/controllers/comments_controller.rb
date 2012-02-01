class CommentsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.create(params[:comment])
    redirect_to hotel_path(@hotel)
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.find(params[:id])
  end

  def new
  @hotel=Hotel.find(params[:hotel_id])
  @comment = @hotel.comments.new
  end
end
