class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('shared.message.hello', user_first_name: current_user.first_name)
  end
end
