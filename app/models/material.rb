# frozen_string_literal: true

class Material < ApplicationRecord
  belongs_to :lesson

  validates :type, :body, presence: true

  def show_body
    body
  end
end
