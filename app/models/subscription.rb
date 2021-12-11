# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :lessons, through: :course
end
