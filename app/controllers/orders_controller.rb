class OrdersController < ApplicationController
  
  
  def new
    @place = Place.find(params[:place_id])
    @order = Order.new
    #@event = Event.place.find(params[:place_id])
  end
  
  def create
    @place = Place.find(params[:place_id])
    @order = @place.create_order(params[:order])
    if @order.save
      @place.update_attributes(params[:status])
      flash[:success] = "You h1ave ordered a ticket"
      redirect_to root_path
    end
  end

  def destroy
  end

  def show
  end

  
  
end
