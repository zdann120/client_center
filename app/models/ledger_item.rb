class LedgerItem < ApplicationRecord
  belongs_to :ledger

  monetize :unit_price_cents

  validates :description, :unit_price, :quantity, :unit_of_measure, presence: true

  def line_total
    unit_price * quantity
  end
end
