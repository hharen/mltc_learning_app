# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :lessons, through: :course

  validates :user, uniqueness: true

  def continue_lesson
    uncompleted_lesson_ids.first
  end

  private

  def uncompleted_lesson_ids
    all_lesson_ids = lessons.pluck(:id)
    return all_lesson_ids if completed_lessons.empty?

    all_lesson_ids - completed_lesson_ids 
  end

  def completed_lesson_ids
    completed_lessons.select do |k, v| 
      v == 'true' 
    end.keys.map(&:to_i)
  end
end
