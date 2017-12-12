class CreateLedgerItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ledger_items do |t|
      t.references :ledger, foreign_key: true
      t.string :description
      t.integer :quantity
      t.string :unit_of_measure
      t.integer :unit_price_cents

      t.timestamps
    end
  end
end
