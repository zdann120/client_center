ActiveAdmin.register Receipt do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :account_id, :description,
    charges_attributes: [:id, :description, :quantity, :unit_of_measure, :unit_price, :_destroy]
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  #
  form do |f|
    inputs 'Receipt Details' do
      input :account
      input :description
    end
    inputs do
      f.has_many :charges, heading: 'Charges', allow_destroy: true,
        new_record: true do |c|
        c.input :description
        c.input :quantity
        c.input :unit_of_measure
        c.input :unit_price
      end
    end
    actions
  end

  index do
    selectable_column
    column :account
    column :description
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :account
      row :description
      row :reference_code
      row :created_at
      row :updated_at
    end

    panel 'Line Items' do
      table_for receipt.charges do
        column :description
        column(:unit_price) { |x| x.unit_price.format }
        column :quantity
        column :unit_of_measure
        column(:line_total) { |x| x.line_total.format }
      end
    end

    h2 "<center>Total: #{receipt.subtotal.format}</center>".html_safe
  end

  action_item :edit_charges, only: :show do
    link_to 'Edit Charges', admin_receipt_charges_path(receipt)
  end

end
