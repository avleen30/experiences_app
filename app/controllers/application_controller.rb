class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_event
    @current_event ||= Event.find(session[:event_id]) if session[:event_id]
  end
  helper_method :current_event

  def authorize
    redirect_to '/login' unless current_user
  end

  private

end
