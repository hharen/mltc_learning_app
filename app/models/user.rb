class User < ApplicationRecord
  has_many :subscriptions
  has_many :courses, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: 'Please write a valid email address' }

  def is_admin?
    is_admin == true
  end

  def name
    [first_name, last_name].compact.join(' ')
  end
end
