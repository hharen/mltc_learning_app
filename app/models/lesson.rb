# frozen_string_literal: true

class Lesson < ApplicationRecord
  default_scope { order(:order) }

  has_many :materials
  belongs_to :topic

  delegate :course, to: :topic

  validates :name, presence: true

  before_save do |lesson|
    Reorderer.new(lesson, :topic_id).reorder!
  end

  def previous
    # if this is the first lesson of the topic
    if self.order == self.topic.lessons.first.order
      # return if self.topic.order ==
      # self.topic.order
      # Topic.where(order: self.)
    else
      self.class.where('"order" < ?', self.order).last
    end
  end

  def next
    self.class.where('"order" > ?', self.order).first
  end
end
