class User < ApplicationRecord
  authenticates_with_sorcery!
  has_secure_token :login_token

  has_many :user_accounts, dependent: :destroy
  has_many :accounts, through: :user_accounts

  after_create :set_password

  enum role: [:guest, :client, :admin]

  def to_s
    email
  end

  def clear_login_token!
    self.login_token = nil
    save
  end

  def set_password
    self.update(password: SecureRandom.uuid)
  end
end
