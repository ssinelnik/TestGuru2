# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      flash[:alert] = 'Authenticate please'
      cookies[:user_requested_path] = request.fullpath
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_no_authentication
    return unless logged_in?
    
    flash[:alert] = 'You are already signed in'
    redirect_to root_path
  end

  def require_authentication
    return if logged_in?
    
    flash[:alert] = 'You are not signed in'
    redirect_to root_path
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
