class AppointmentPolicy < ApplicationPolicy
  def index?
    return true if record.count == 0
    record.first.attendable.users.include?(user) || user.admin?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
