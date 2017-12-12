class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :contactable, polymorphic: true
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :primary_phone
      t.string :alternate_phone
      t.string :linking_code

      t.timestamps
    end
    add_index :contacts, :linking_code, unique: true
  end
end
