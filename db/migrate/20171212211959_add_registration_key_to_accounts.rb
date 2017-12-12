class AddRegistrationKeyToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :registration_key, :string
    add_index :accounts, :registration_key, unique: true
  end
end
