class ApplicationController < ActionController::Base
	helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    if current_user.nil?
      redirect_to new_session_path, alert: 'Please log in'
    end
  end
end
