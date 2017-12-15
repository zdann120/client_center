class Invoice < Ledger
  jsonb_accessor :metadata,
                 invoice_date: :date,
                 due_date: :date,
                 xero_invoice_number: :string,
                 email_address: :string
  has_many :line_items, class_name: 'Invoice::LineItem', dependent: :destroy,
           foreign_key: 'ledger_id'

end