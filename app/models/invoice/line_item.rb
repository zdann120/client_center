class Invoice::LineItem < LedgerItem
  belongs_to :invoice, foreign_key: 'ledger_id'
end