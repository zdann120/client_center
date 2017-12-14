class Accounts::DashboardController < Accounts::ApplicationController
  before_action :require_login
  def show
    @account = Account.find_by_code(params[:id])
    authorize @account
  end

  def registration_invite
    @account = Account.find_by_code(params[:id])
    authorize @account
    @pdf = Account::RegistrationInvite.new(@account)
    respond_to do |format|
      format.pdf {
        send_data @pdf.render, type: 'application/pdf', disposition: :inline
      }
    end
  end
end
