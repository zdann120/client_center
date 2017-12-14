class Account::RegistrationInvite
  include Prawn::View

  def initialize(account)
    @account = account
    header
    account_info
    intro_text
    printed_at
  end

  def header
    text 'ZDN Enterprises, LLC.'
    horizontal_rule
    move_down 10
  end

  def account_info
    data = [
        ['Account Name', @account.title],
        ['Account Number', @account.code]
    ]
    table data, position: :center
    move_down 10
  end

  def intro_text
    font('Courier') do
      text 'You are seconds away from accessing your account data online!'
      move_down 5
      text 'To activate your account:'
      text '1) Visit https://portal.zdn.enterprises'
      text '2) Click the link to indicate you have a Registration Key'
      text '3) When prompted, enter your registration key:'
      text @account.registration_key, size: 18, style: :bold, align: :center
      text '4) Enter your email address when prompted to complete your enrollment.'

    end
  end

  def printed_at
    text "Printed on #{Time.zone.now.strftime('%b %e, %Y at %I:%M %p')}", size: 8, align: :center
  end
end