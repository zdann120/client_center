class Account < ApplicationRecord
  before_create :set_account_code!

  has_many :user_accounts
  has_many :users, through: :user_accounts
  has_many :receipts

  def default_contact
    return 0 if default_contact_id == 0
    User.find(default_contact_id)
  end

  private

  def set_account_code!
    self.code = loop do
      ulid = ULID.generate
      break ulid unless Account.exists?(code: ulid)
    end
  end
end
