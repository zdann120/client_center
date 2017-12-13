class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  helper_method :authenticate_admin_user!

  def authenticate_admin_user!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: 'You are not an admin.'
    end
  end

  def ensure_contact_details
    if current_user.contact.valid?
      return true
    else
      redirect_to edit_users_contact_url, alert: "Please complete your contact details:"
    end
  end
end
