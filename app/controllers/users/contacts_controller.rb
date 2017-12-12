class Users::ContactsController < ApplicationController
  def edit
    @contact = current_user.contact
  end

  def update
    @contact = current_user.contact
    if @contact.update(contact_params)
      redirect_to edit_users_contact_url,
        notice: 'Changes saved successfully.'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :first_name,
      :last_name,
      :business_name,
      :address_line_1,
      :address_line_2,
      :city,
      :state,
      :zip_code,
      :country,
      :primary_phone,
      :alternate_phone,
      :email
    )
  end
end
