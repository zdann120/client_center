class ProcessAccountEmail < ActiveInteraction::Base
  hash :email_hash, strip: false

  def execute
    account = Account.find_by_code email_hash['ToFull'][0]['MailboxHash']
    account
  end
end