class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  has_secure_token :linking_code

  validates :contactable_id, uniqueness: { scope: :contactable_type }

  delegate :email, to: :contactable
end
