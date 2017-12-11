class EmailAuthenticationMailer < ApplicationMailer
  def send_login_link(user)
    @user = user
    mail to: user.email,
      from: 'accounts@zdnenterprises.com',
      subject: 'Your temporary login link'
  end
end
