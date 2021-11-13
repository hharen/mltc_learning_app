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
end

# TODO: if order isn't set make it a last order
