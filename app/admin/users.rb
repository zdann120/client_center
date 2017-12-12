ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :role
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  #
  form do |f|
    inputs 'User Detail' do
      input :email
      input :role
    end
    actions
  end

  show do
    h3 user.email
    attributes_table do
      row :email
      row :role
      row :contact
    end

    panel 'Contact Data' do
      attributes_table_for user.contact do
        row :first_name
        row :last_name
        row :primary_phone
        row :alternate_phone
        row :address_line_1
        row :address_line_2
        row :city
        row :state
        row :zip_code
      end
    end
  end

  index do
    selectable_column
    column :email
    column :role
    column :updated_at
    actions
  end

end
