class User < ApplicationRecord
  delegate :first_name, :last_name, :business_name,
    :address_line_1, :address_line_2, :city,
    :state, :zip_code, :country, :primary_phone,
    :alternate_phone, to: :contact
  authenticates_with_sorcery!
  has_secure_token :login_token

  has_many :user_accounts, dependent: :destroy
  has_many :accounts, through: :user_accounts
  has_many :appointments
  has_one :contact, as: :contactable

  accepts_nested_attributes_for :contact

  after_create :set_password
  after_create :create_contact!, if: -> { contact.blank? }

  enum role: [:guest, :client, :admin]


  def to_s
    if !!full_name
      full_name
    else
      self.email
    end
  end

  def full_name
    if contact && !first_name.blank? && !last_name.blank?
      "#{first_name} #{last_name}"
    else
      false
    end
  end

  def clear_login_token!
    self.login_token = nil
    save
  end

  def set_password
    self.update(password: SecureRandom.uuid)
  end
end
