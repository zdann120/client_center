class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :admin, foreign_key: true
      t.string :asset

      t.timestamps
    end
  end
end
