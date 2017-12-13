class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.references :emailable, polymorphic: true
      t.string :token
      t.jsonb :data

      t.timestamps
    end
    add_index :emails, :token, unique: true
  end
end
