class Receipt < Ledger
  has_many :charges, foreign_key: 'ledger_id'
end
