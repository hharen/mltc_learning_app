# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  # FIXME: add policy to show just preview lessons to sign out users

  def show
    @lesson = Lesson.find(params[:id])
    @subscription = current_user.subscriptions.where(course: @lesson.course).first
    @completed = @lesson.completed?(@subscription)
  end
end
