# frozen_string_literal: true

class Material < ApplicationRecord
  default_scope { order(:order) }

  belongs_to :lesson
  has_one :topic, through: :lesson

  validates :order, :body, :type, presence: true

  before_save do |material|
    Reorderer.new(material, :lesson_id, Material).reorder!
  end

  def show_body
    body
  end
end
