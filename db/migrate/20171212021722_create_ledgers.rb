class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.string :type
      t.string :reference_code
      t.references :admin, foreign_key: true

      t.timestamps
    end
    add_index :ledgers, :reference_code, unique: true
  end
end
