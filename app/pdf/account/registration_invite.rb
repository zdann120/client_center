class Account::RegistrationInvite
  include Prawn::View

  def initialize(account)
    @account = account
    header
    account_info
    intro_text
    returning_users
    caution
    printed_at
  end

  def header
    text 'ZDN Enterprises, LLC.'
    horizontal_rule
    move_down 5
    text 'Online Portal Registration', size: 18, style: :bold, align: :center
  end

  def account_info
    data = [
        ['Account Name', @account.title],
        ['Account Number', @account.code]
    ]
    table data, position: :center
    move_down 20
  end

  def intro_text
    text '** If you have never used the online portal in the past:', style: :bold
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

  def returning_users
    move_down 10
    text '** If you are a returning user:', style: :bold
    font('Courier') do
      text '1) Visit https://portal.zdn.enterprises'
      text '2) Enter the email address associated with your account.'
      text '3) We will email you a login link.'
    end
  end

  def caution
    move_down 5
    stroke_horizontal_rule
    move_down 5
    text 'NOTICE: Please keep this document safe. This registration key can be used to create multiple accounts.',
         size: 10
  end

  def printed_at
    text "Printed on #{Time.zone.now.strftime('%b %e, %Y at %I:%M %p')}", size: 8, align: :center
  end
end