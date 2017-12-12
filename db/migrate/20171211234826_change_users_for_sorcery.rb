class ChangeUsersForSorcery < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :encrypted_password, :crypted_password
    add_column :users, :salt, :string
    change_column :users, :crypted_password, :string, null: true
  end
end
