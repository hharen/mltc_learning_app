# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :materials
  belongs_to :topic
  belongs_to :course, through: :topic

  validates :name, presence: true
end
