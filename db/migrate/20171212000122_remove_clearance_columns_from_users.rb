class RemoveClearanceColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :remember_token, :string, unique: true    
  end
end
