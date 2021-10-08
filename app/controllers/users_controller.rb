class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_user_path(@user)
    else
      render :edit, flash: {error: @user.errors.messages}
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :password)
  end
end