class ProcessAccountEmail < ActiveInteraction::Base
  hash :email_hash, strip: false

  def execute
    InboundEmailsMailer.invalid_mailbox(email_hash).deliver_later!
  end
end