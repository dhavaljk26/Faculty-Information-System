class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_faculty

  protected

  def logged_in?
    session[:faculty_id]
  end

  def current_faculty
    @current_faculty ||= Faculty.find(session[:faculty_id])
  end
end
