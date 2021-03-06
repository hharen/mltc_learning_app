# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authorize

  def authorize
    redirect_to :root unless current_user&.admin?
  end
end
