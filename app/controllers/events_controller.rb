class EventsController < ApplicationController
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(params[:event])
    @place = 10.times{@event.places.create(params[:event])}
    if @event.save
      flash[:success] = "Event created"
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @place = @event.places.all
  end

  def index
    @event = Event.all
  end

  def destroy
  end
  
  def calendar
    @events = Event.all
  end
  
end
