class Ledger < ApplicationRecord
  belongs_to :account
  has_secure_token :reference_code
  has_many :ledger_items
  validates :description, presence: true

  def subtotal
    ledger_items.map{|i| i.line_total}.sum
  end
end
