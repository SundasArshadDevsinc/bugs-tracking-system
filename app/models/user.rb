class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :projects, dependent: :destroy
  has_many :bugs, dependent: :destroy
  enum role: { developer: 0, manager: 1, qa: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
end
