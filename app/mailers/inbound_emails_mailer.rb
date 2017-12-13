class InboundEmailsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inbound_emails_mailer.success.subject
  #
  def success(email)
    @email = email

    mail to: @email.data['From'],
         subject: 'Success: Message posted to account.',
         from: 'do-not-reply@zdnenterprises.com'
  end

  def invalid_mailbox(email_hash)
    @email_hash = email_hash
    mail to: @email_hash['From'],
         subject: 'Error processing your request.',
         from: '"ZDN Enterprises, LLC" <do-not-reply@zdnenterprises.com>'
  end
end
