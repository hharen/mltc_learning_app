# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user)
    else
      render :edit, flash: { error: @user.errors.messages }
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email)
  end
end
