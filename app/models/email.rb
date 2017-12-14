class Email < ApplicationRecord
  belongs_to :emailable, polymorphic: true, optional: true
  has_secure_token
end
