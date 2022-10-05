# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :topics
  has_many :lessons, through: :topics

  validates :name, presence: true, uniqueness: true

  def last_completed_lesson(user:)
    lessons.select { |lesson| lesson.completed?(subscriptions.where(user: user).first) }.last
  end
end
