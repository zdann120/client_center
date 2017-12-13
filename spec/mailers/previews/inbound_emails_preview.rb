# Preview all emails at http://localhost:3000/rails/mailers/inbound_emails
class InboundEmailsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inbound_emails/success
  def success
    InboundEmailsMailer.success
  end

end
