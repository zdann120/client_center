class ReceiptPolicy < ApplicationPolicy
  def show?
    user.admin? or (record.account.users.include?(user))
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
