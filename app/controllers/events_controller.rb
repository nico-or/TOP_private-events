class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, only: %i[show]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    @event.attending_users << current_user

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
