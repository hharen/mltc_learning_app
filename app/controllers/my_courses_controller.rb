# frozen_string_literal: true

class MyCoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses
  end
end
