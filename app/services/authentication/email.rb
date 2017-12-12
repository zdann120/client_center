class Authentication::Email < ActiveInteraction::Base
  string :email

  validates :email, presence: true

  def execute
    unless User.exists?(email: email)
      errors.add(:email, 'is not linked to any account.')
      return false
    end

    user = User.find_by_email(email)
    user.regenerate_login_token
    EmailAuthenticationMailer.send_login_link(user).deliver_later!
    user.update!(login_token_sent: Time.zone.now)
    return user.login_token
  end
end
