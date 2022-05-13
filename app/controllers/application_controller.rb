class ApplicationController < ActionController::Base

  helper_method :authorize

  private

  def authorize
    user ||= (@user || @event.host)
    unless current_user.eql? user
      redirect_to root_path, alert: "You're not authorized to perform that action"
    end
  end
end
