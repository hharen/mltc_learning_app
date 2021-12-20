# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :lessons, through: :course

  def continue_lesson
    uncompleted_lesson_ids.first
  end

  private

  def uncompleted_lesson_ids
    lessons.pluck(:id) - completed_lessons.select {|k, v| v == 'true' }.keys.map(&:to_i)
  end
end
