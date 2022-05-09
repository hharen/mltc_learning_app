# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = User.all
    end

    def new
      user = User.new
    end

    def create
      user = User.new(user_params)
      user.password = rand_password
      if user.save
        redirect_to edit_admin_user_path(@user)
      else
        render :edit, flash: { error: @user.errors.messages }
      end
    end


  end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email)
  end

  def rand_password
    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
