class Account < ApplicationRecord
  before_create :set_account_code!

  has_many :user_accounts
  has_many :users, through: :user_accounts
  has_many :receipts
  has_many :documents
  belongs_to :default_user, class_name: 'User',
    foreign_key: 'default_user_id'

  private

  def set_account_code!
    self.code = loop do
      ulid = ULID.generate
      break ulid unless Account.exists?(code: ulid)
    end
  end
end
