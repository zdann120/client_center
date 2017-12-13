class ProcessAccountEmail < ActiveInteraction::Base
  hash :email_hash, strip: false

  def execute
    account = Account.find_by_code email_hash['ToFull'][0]['MailboxHash']
    errors.add(:account, 'not found') unless account
    return unless account
    email = account.emails.create!(data: email_hash)
    InboundEmailsMailer.success(email).deliver_later!
    account
  end
end