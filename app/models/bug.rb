class Bug < ApplicationRecord
    enum bug_type: { feature: 0, bug: 1}
    enum bug_status: { new_bug: 0, started: 1, completed: 2 }
    belongs_to :project
    belongs_to :user
    has_one_attached :image
end
