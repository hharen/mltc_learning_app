# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def update
    update_lesson_completed
    redirect_to lesson_path(find_lesson)
  end

  private

  def update_lesson_completed
    subscription = find_subscription
    subscription.completed_lessons[find_lesson.id.to_s] = params[:subscription][:completed]
    subscription.save!
  end

  def find_lesson
    find_subscription.lessons.find(params[:subscription][:lesson_id])
  end

  def find_subscription
    Subscription.find(params[:id])
  end
end
