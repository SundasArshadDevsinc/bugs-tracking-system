class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :bugs, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  
  enum role: { developer: 0, manager: 1, qa: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
end
