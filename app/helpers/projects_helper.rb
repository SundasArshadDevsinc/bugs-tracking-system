module ProjectsHelper
    def assign_developer
        User.where.not(role: :manager)
        .pluck(:name, :role, :id)
        .map { |name, role, id| ["#{name}: #{role}", id] }
    end
end
