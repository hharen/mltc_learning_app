# frozen_string_literal: true

class Lesson < ApplicationRecord
  default_scope { order(:order) }

  has_many :materials
  belongs_to :topic

  delegate :course, to: :topic

  validates :name, presence: true

  before_validation do |lesson|
    Reorderer.new(lesson, :topic_id).reorder!
  end

  def previous
    find_neighbouring_lesson(- 1)
  end

  def next
    find_neighbouring_lesson(1)
  end

  def completed?(subscription)
    subscription.completed_lessons[id.to_s] == 'true'
  end

  private

  def find_neighbouring_lesson(direction)
    lessons_ids = course.topics.map(&:lessons).flatten.pluck(:id)
    lesson_index = lessons_ids.index(id)
    Lesson.find(lessons_ids[
      (lesson_index + direction).clamp(0, lessons_ids.length - 1)
    ])
  end
end
