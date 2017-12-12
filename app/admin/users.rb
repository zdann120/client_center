ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :role,
                account_ids: [],
                contact_attributes: [:id, :first_name, :last_name,:primary_phone, :alternate_phone,
                :address_line_1, :address_line_2, :city, :state, :zip_code, :country]
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
      input :accounts, as: :check_boxes
    end

    inputs 'Contact Data' do
      f.has_many :contact, allow_destroy: false, new_record: false do |c|
        c.input :first_name
        c.input :last_name
        c.input :primary_phone
        c.input :alternate_phone
        c.input :address_line_1
        c.input :address_line_2
        c.input :city
        c.input :state
        c.input :zip_code
        c.input :country
      end
    end
    actions
  end

  show do
    h3 user.email
    attributes_table do
      row :email
      row :role
      row :accounts do |u|
        ul do
          u.accounts.each do |acc|
            li do 
              "[#{acc.code}] #{acc.title}"
            end
          end
        end
      end
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
