class Bug < ApplicationRecord
    belongs_to :project
    belongs_to :user
    has_one_attached :image

    enum types: { feature: 0, bug: 1}
    enum status: { initial: 0, started: 1, completed: 2, resolved: 2}

    validates :title, presence: true, uniqueness: true
    validates :deadline, presence: true
    validates :types, presence: true
    validates :status, presence: true
end
