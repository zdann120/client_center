class AccountPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    record.users.include?(user)
  end

  def registration_invite?
    record.users.include?(user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
