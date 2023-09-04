class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def update?
     user.qa? || user.developer?
  end

  def destroy?
    user.qa?
  end
  
  def create?
     user.qa?
  end
  
  def update_bug_status?
    user.developer? # Only developers can update bug statuses
  end
  
end
