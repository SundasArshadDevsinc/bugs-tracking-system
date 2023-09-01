class Project < ApplicationRecord
  belongs_to :user
  has_many :bugs, dependent: :destroy

  validates :title, presence: true, uniqueness: true
    
  paginates_per 3
  scope :for_user, ->(user) {
    if user.developer?
      where("#{user.id} = ANY(assignee_ids)")
    elsif user.manager?
      where(id: user.projects)
    else
      all
    end
  }
end
