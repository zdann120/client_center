class Email < ApplicationRecord
  belongs_to :emailable, polymorphic: true
  has_secure_token
end
