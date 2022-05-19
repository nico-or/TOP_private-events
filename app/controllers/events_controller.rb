class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, except: %i[index new create]
  before_action :authorize, only: %i[edit]

  def index
    @events = Event.all.includes(:host)
  end

  def show
    @attendance = Attendance.find_or_initialize_by(user: current_user, event: @event)
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

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to user_path(current_user), notice: 'Event deleted successfully.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end
