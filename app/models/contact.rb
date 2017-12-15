class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  has_secure_token :linking_code

  has_paper_trail

  validates :contactable_id, uniqueness: { scope: :contactable_type }

  validates :first_name, :last_name, :primary_phone, :address_line_1, :city, :state, :zip_code,
            :country, presence: true, unless: :new_record?

  delegate :email, to: :contactable

  phony_normalize :primary_phone, default_country_code: 'US'
  phony_normalize :alternate_phone, default_country_code: 'US'
end
