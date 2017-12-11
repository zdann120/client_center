class User < ApplicationRecord
  include Clearance::User
  has_secure_token :login_token

  has_many :user_accounts
  has_many :accounts, through: :user_accounts

  def clear_login_token!
    self.login_token = nil
    save
  end
end
