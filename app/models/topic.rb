class Topic < ApplicationRecord
  has_many :lessons
  has_many :materials, through: :lessons
  belongs_to :course

  validates :name, presence: true
end