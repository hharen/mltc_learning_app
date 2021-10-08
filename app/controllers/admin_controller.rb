class AdminController < ApplicationController
  before_action :authorize

  def authorize
    redirect_to :root unless current_user&.is_admin?
  end
end