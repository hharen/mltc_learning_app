# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable

  has_many :subscriptions
  has_many :courses, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable and :omniauthable
  # devise :database_authenticatable,
  #        :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: 'Please write a valid email address' }

  def admin?
    is_admin == true
  end

  def name
    [first_name, last_name].compact.join(' ')
  end
end
