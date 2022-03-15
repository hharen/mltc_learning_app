# frozen_string_literal: true

class Lesson < ApplicationRecord
  default_scope { order(:order) }

  has_many :materials, dependent: :destroy
  belongs_to :topic

  delegate :course, to: :topic

  validates :name, presence: true

  before_validation do |lesson|
    Reorderer.new(lesson, :topic_id).reorder!
  end

  def previous
    neighbouring_lesson(- 1)
  end

  def next
    neighbouring_lesson(1)
  end

  def completed?(subscription)
    subscription.completed_lessons[id.to_s] == 'true' unless subscription.nil?
  end

  def first?
    neighbouring_lesson(-1).nil?
  end

  def last?
    neighbouring_lesson(1).nil?
  end

  private

  def neighbouring_lesson(direction)
    lessons_ids = course.topics.map(&:lessons).flatten.pluck(:id)
    lesson_index = lessons_ids.index(id)
    new_lesson_index = lesson_index + direction

    return nil if new_lesson_index.negative?
    return nil if (new_lesson_index) > (lessons_ids.count - 1)

    get_lesson(lessons_ids, new_lesson_index)
  end

  def get_lesson(lessons_ids, new_lesson_index)
    Lesson.find(lessons_ids[
      new_lesson_index.clamp(0, lessons_ids.length - 1)
    ])
  end
end
