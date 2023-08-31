class Bug < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :deadline, presence: true
    validates :type, presence: true
    validates :status, presence: true
    enum types: { feature: 0, bug: 1}
    enum status: { initial: 0, started: 1, completed: 2}
    belongs_to :project
    belongs_to :user
    has_one_attached :image
    belongs_to :developer, class_name: 'User', foreign_key: 'developer_id'
end
