class AddTypeToLedgerItems < ActiveRecord::Migration[5.1]
  def change
    add_column :ledger_items, :type, :string
  end
end
