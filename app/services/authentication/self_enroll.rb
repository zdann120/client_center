class Authentication::SelfEnroll < ActiveInteraction::Base
  string :email
  string :account_registration_key

  validates :email, :account_registration_key, presence: true

  def execute

    account = Account.find_by_registration_key(account_registration_key)

    errors.add(:user, 'already exists. Please login before enrolling additional accounts.') if User.exists?(email: email)
    errors.add(:account_registration_key, 'is invalid.') unless !!account

    return if errors.any?

    if User.exists?(email: email)
      user = User.find_by_email(email)
      user.accounts << account unless user.accounts.include?(account)
      return user
    else
      user = User.create(email: email, role: 'client')
      errors.merge!(user.errors) if user.errors.any?
      user.accounts << account
      return user
    end
  end
end