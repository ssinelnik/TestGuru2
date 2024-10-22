# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def require_authentication
    return if logged_in?

    flash[:alert] = 'You are not signed in!'
    redirect_to root_path
  end
end
