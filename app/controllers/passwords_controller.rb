class PasswordsController < Devise::PasswordsController

  # Flash message added, no other changes
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
      flash[:success] = t('devise.password_reset')
    else
      respond_with(resource)
    end
  end

  # Monkey patched as the after_sending_reset_password_instructions_path_for was returning nil
  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    new_user_session_path
  end
end
