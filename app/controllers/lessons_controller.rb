# frozen_string_literal: true

class LessonsController < ApplicationController
  # FIXME: add policy to show just preview lessons to sign out users  

  def show
    @lesson = Lesson.find(params[:id])
  end
end