module ProjectsHelper
    def assign_developer
        options = []
        list = User.where.not(role: :manager).pluck(:name, :role, :id)
        list.map do |opt|
            options << [opt[0]+": "+opt[1], opt[2]]
        end
        return options
    end
end
