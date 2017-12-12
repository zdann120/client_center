class AddDescriptionToLedgers < ActiveRecord::Migration[5.1]
  def change
    add_column :ledgers, :description, :text
  end
end
