class Account < ApplicationRecord
  before_create :set_account_code!
  before_create :set_registration_key

  has_many :user_accounts, dependent: :destroy
  has_many :users, through: :user_accounts
  has_many :receipts, dependent: :nullify
  has_many :documents, dependent: :nullify
  has_many :appointments, as: :attendable
  has_many :emails, as: :emailable, dependent: :nullify
  has_many :action_items, as: :actor, dependent: :destroy
  belongs_to :default_user, class_name: 'User',
    foreign_key: 'default_user_id', optional: true

  accepts_nested_attributes_for :action_items

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
      #haiku = Haikunator.haikunate
      haiku = Cannabinator.cannabinate
      break haiku unless Account.exists?(registration_key: haiku)
    end
  end
end
