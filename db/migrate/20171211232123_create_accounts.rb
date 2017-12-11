class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :code, null: false
      t.string :title, null: false
      t.boolean :active, default: true, null: false
      t.integer :default_user_id, default: 0, null: false

      t.timestamps
    end
    add_index :accounts, :code, unique: true
    add_index :accounts, :title, unique: true
  end
end
