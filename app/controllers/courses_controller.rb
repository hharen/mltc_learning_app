# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    # @subscription = Subscription.where(course: @course, user: current_user)
  end
end
