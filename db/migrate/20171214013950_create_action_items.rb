class CreateActionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :action_items do |t|
      t.references :actor, polymorphic: true
      t.text :description, default: false, null: false
      t.boolean :urgent, default: false, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
