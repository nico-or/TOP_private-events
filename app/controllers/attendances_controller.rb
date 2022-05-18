class AttendancesController < ApplicationController
  before_action :authorize

  def create
    if @attendance = Attendance.find_by(attendance_params)
      redirect_to event_path(@attendance.event), alert: "You're already attending this event."
    else
      @attendance = Attendance.create(attendance_params)
      redirect_to event_path(@attendance.event), notice: 'Succesfully joined this event.'
    end
  end

  def destroy
    @attendance = Attendance.find_by(attendance_params)
    @attendance.destroy
    redirect_to event_path(@attendance.event), notice: 'Succesfully leaved this event.'
  end

  private

  def authorize
    if current_user != User.find(attendance_params[:user_id])
      redirect_to event_path(Event.find(attendance_params[:event_id])), alert: "You're not authorized to perform that action"
    end
  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
