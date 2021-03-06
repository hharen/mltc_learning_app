# frozen_string_literal: true

class Topic < ApplicationRecord
  default_scope { order(:order) }

  has_many :lessons
  has_many :materials, through: :lessons
  belongs_to :course

  validates :name, presence: true

  before_validation do |topic|
    Reorderer.new(topic, :course_id).reorder!
  end

  def completed?(subscription)
    lessons.all? do |lesson|
      lesson.completed?(subscription)
    end
  end
end
