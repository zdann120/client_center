ActiveAdmin.register Charge do
  belongs_to :receipt

  permit_params :description, :quantity, :unit_of_measure, :unit_price

  form do |f|
    inputs 'Charge Details' do
      input :description
      input :quantity
      input :unit_of_measure
      input :unit_price
    end
    actions
  end

  show do
    attributes_table do
      row :receipt
      row :description
      row :line_details do
        raw "#{charge.unit_price.format} &times; #{charge.quantity} #{charge.unit_of_measure} = <strong>#{charge.line_total.format}</strong>"
      end
    end
  end

  action_item :back_to_receipt do
    link_to 'View Receipt', admin_receipt_path(charge.receipt)
  end

end
