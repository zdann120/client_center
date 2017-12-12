class Authentication::SelfEnroll < ActiveInteraction::Base
  string :email
  string :account_registration_key

  validates :email, :account_registration_key, presence: true

  def execute

    account = Account.find_by_registration_key(account_registration_key)

    errors.add(:user, 'already exists') if User.exists?(email: email)
    errors.add(:account_registration_key, 'is invalid.') unless !!account

    return if errors.any?

    user = User.create(email: email, role: 'client')
    errors.merge!(user.errors) if user.errors.any?
    user.accounts << account
    return user
  end
end