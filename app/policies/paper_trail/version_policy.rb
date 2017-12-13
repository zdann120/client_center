class PaperTrail::VersionPolicy < ApplicationPolicy
  def show?
    user.admin? || record_owner?
  end

  def record_owner?
    if record.item.try(:user)
      record.item.user == user
    else
      false
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
