# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  # FIXME: add policy to show just preview lessons to sign out users

  def show
    @lesson = Lesson.find(params[:id])
    @subscription = current_user.subscriptions.where(course: @lesson.course).first
    if @subscription.nil?
      flash[:notice_with_url] = t('lessons.get_course_html', course_name: @lesson.course.name, href: helpers.link_to('Moms Learn to Code', 'https://www.momslearntocode.com'))
      redirect_to subscriptions_path
    else
      @completed = @lesson.completed?(@subscription)
    end
  end
end
