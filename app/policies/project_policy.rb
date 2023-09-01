class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, project)
    @user = user
    @project = project
  end

  def update?
    user.manager?
  end
  
  def destroy?
    user.manager?
  end

  def create?
    user.manager? 
  end

end
