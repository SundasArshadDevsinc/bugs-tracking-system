class User < ApplicationRecord
  has_many :projects
  has_many :bugs
  enum role: { developer: 0, manager: 1, qa: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
end
