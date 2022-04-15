# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :redirect_subdomain

  def redirect_subdomain
    if request.host == 'momslearntocode.com'
      redirect_to 'https://www.momslearntocode.com' + request.fullpath, :status => 301
    end
  end

  def configure_permitted_parameters
    update_attrs = %i[password password_confirmation current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
