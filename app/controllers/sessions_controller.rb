# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('shared.message.hello', user_first_name: current_user.first_name)
  end

  #  def destroy
  #   # Logic to log out the user (e.g., clearing the session)
  #   session.delete(:id)
  #   redirect_to root_path, notice: 'Logged out successfully.'
  # end
end
