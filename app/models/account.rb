class Account < ApplicationRecord
  before_create :set_account_code!
  before_create :set_registration_key

  has_many :user_accounts, dependent: :destroy
  has_many :users, through: :user_accounts
  has_many :receipts, dependent: :nullify
  has_many :documents, dependent: :nullify
  has_many :appointments, as: :attendable
  has_many :emails, as: :emailable
  belongs_to :default_user, class_name: 'User',
    foreign_key: 'default_user_id'

  def set_registration_key!
    set_registration_key
    save
  end

  private

  def set_account_code!
    self.code = loop do
      ulid = ULID.generate
      break ulid unless Account.exists?(code: ulid)
    end
  end

  def set_registration_key
    self.registration_key = loop do
      haiku = Haikunator.haikunate
      break haiku unless Account.exists?(registration_key: haiku)
    end
  end
end
