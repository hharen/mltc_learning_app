# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :name, presence: true, uniqueness: true
end
