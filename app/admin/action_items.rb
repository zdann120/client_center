ActiveAdmin.register ActionItem do
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
  member_action :mark_complete, method: :put do
    resource.update!(completed: true)
    redirect_to [:admin, resource.actor]
  end

  member_action :mark_incomplete, method: :put do
    resource.update!(completed: false)
    redirect_to [:admin, resource.actor]
  end

end
