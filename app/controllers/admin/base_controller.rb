# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    unless current_user.is_a?(Admin)
      redirect_to root_path,
                  alert: 'You are not authorized to view this page(only Admin).'
    end
  end
end
