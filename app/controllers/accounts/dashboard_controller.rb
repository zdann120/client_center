class Accounts::DashboardController < ApplicationController
  def show
    @account = Account.find_by_code(params[:code])
    authorize @account
  end
end
