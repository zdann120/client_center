class AddLoginTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login_token, :string, null: true
    add_index :users, :login_token, unique: true
    add_column :users, :login_token_sent, :datetime, null: true
  end
end
