class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    true
    # record.user == user # || user.admin?
  end

  def delete?
    true
    # record.user == user # || user.admin?
  end
end
