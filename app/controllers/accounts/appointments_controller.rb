class Accounts::AppointmentsController < ApplicationController
  before_action :require_login
  def index
    @account = Account.find_by_code params[:account_id]
    @appointments = @account.appointments
    authorize @appointments
  end
end
