class RemoveAccountDefaultUserConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :default_user_id, :integer, null: true, default: nil
  end
end
