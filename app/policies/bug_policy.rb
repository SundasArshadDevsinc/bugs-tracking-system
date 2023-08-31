class BugPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def update?
    user.manager? || user.qa? || user.developer?
  end
  def destroy?
    user.manager? || user.qa?
  end
  def create?
    user.manager? || user.qa?
  end

end
