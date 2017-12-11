class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.references :user, foreign_key: true
      t.references :account, foreign_key: true
      t.integer :access_level, default: 0, null: false

      t.timestamps
    end
  end
end
