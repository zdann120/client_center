class LedgerItem < ApplicationRecord
  belongs_to :ledger

  monetize :unit_price_cents

  def line_total
    unit_price * quantity
  end
end
