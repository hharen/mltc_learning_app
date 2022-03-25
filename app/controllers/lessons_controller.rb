# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  # FIXME: add policy to show just preview lessons to sign out users

  def show
    @lesson = Lesson.find(params[:id])
    @subscription = current_user.subscriptions.where(course: @lesson.course).first
    if @subscription.nil?
      flash[:notice] = "You don't own #{@lesson.course.name}, go to #{helpers.link_to('www.momslearntocode.com', 'https://www.momslearntocode.com')} to get it."
      redirect_to subscriptions_path
    else
      @completed = @lesson.completed?(@subscription)
    end
  end
end
