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
  permit_params :title, :active, :default_user_id, :registration_key,
                action_items_attributes: [:description, :urgent, :completed, :id]

  show do
    attributes_table do
      row :code
      row :title
      row :default_user
      row(:users) { |a| a.users.map{|u| u.to_s} }.join(', ').to_s
      row :registration_key
      row :active
    end

    panel 'Appointments' do
      table_for account.appointments do
        column :starts_at
        column :description
        column :status
      end
    end

    panel 'Action Items' do
      table_for account.action_items do
        column :description
        column :urgent
        column :completed
        column :mark_complete do |ai|
          if !ai.completed?
            link_to 'Mark Completed', mark_complete_admin_action_item_path(ai), method: :put
          else
            link_to 'Reset', mark_incomplete_admin_action_item_path(ai), method: :put
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :default_user
      f.input :title
      f.input :active
    end

    f.inputs do
      f.has_many :action_items, allow_destroy: true do |ai|
        ai.input :description
        ai.input :urgent
        ai.input :completed
      end
    end
    actions
  end

  action_item :add_appointment, only: :show do
    link_to 'Add Appointment', admin_account_account_appointment_path(account)
  end

  action_item :print_invite, only: :show do
    link_to 'Print Invite', invite_account_path(account.code, format: :pdf), target: '_blank'
  end
end
