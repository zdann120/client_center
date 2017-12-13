class Accounts::AppointmentsController < ApplicationController
  def index
    @account = Account.find_by_code params[:account_id]
    @appointments = @account.appointments
  end
end
