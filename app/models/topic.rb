# frozen_string_literal: true

class Topic < ApplicationRecord
  default_scope { order(:order) }

  has_many :lessons
  has_many :materials, through: :lessons
  belongs_to :course

  validates :name, presence: true

  before_save do |topic|
    Reorderer.new(topic, :course_id).reorder!
  end

  def completed
    all_topic_lessons.all?(&:completed)
  end

  private

  def all_topic_lessons
    self.lessons
  end
end
