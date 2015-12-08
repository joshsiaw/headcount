class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
      flash[:notice] = "Event successfully created"
    else
      respond_with(@event)
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
      flash[:notice] = "Event successfully updated"
    else
      respond_with(@event)
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
      flash[:notice] = "Event successfully destroyed"
    else
      respond_with(@event)
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:date, :venue, :category)
    end
end
