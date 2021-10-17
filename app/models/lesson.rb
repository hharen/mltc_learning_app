# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :materials
  belongs_to :topic

  delegate :course, to: :topic

  validates :name, presence: true
end
