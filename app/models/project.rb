class Project < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    belongs_to :user
    has_many :bugs, dependent: :destroy
    paginates_per 3
end
