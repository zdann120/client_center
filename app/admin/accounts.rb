ActiveAdmin.register Account do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :title, :active, :default_user_id, :registration_key

  form do |f|
    f.inputs do
      f.input :default_user
      f.input :title
      f.input :active
    end
    actions
  end

  action_item :add_appointment, only: :show do
    link_to 'Add Appointment', admin_account_account_appointment_path(account)
  end

end
