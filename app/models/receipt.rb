class Receipt < Ledger
  has_many :charges, foreign_key: 'ledger_id'
  accepts_nested_attributes_for :charges
end
