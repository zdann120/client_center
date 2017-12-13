class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :token
      t.string :description
      t.datetime :starts_at
      t.integer :duration_minutes
      t.integer :state
      t.string :kind

      t.timestamps
    end
    add_index :appointments, :token, unique: true
  end
end
