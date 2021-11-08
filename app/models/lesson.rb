# frozen_string_literal: true

class Lesson < ApplicationRecord
  default_scope { order(:order) }

  has_many :materials
  belongs_to :topic

  delegate :course, to: :topic

  validates :name, presence: true

  before_save :reorder

  private

  def reorder
    lessons_to_reorder = Lesson.where(topic_id: self.topic_id, order: (self.order..))
    lessons_to_reorder.reverse.each do |lesson|
      lesson.update_column(:order, lesson.order+1)
    end
  end
end
