class Charge < LedgerItem
  belongs_to :receipt, foreign_key: 'ledger_id'
end
