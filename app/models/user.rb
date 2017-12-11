class User < ApplicationRecord
  include Clearance::User
  has_secure_token :login_token

  def clear_login_token!
    self.login_token = nil
    save
  end
end
