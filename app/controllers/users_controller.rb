class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @hosted_events = @user.hosted_events.records
    @future_events = @user.attending_events.future.records
    @past_events = @user.attending_events.past.records
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
