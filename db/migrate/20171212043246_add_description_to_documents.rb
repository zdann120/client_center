class AddDescriptionToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :description, :text
  end
end
