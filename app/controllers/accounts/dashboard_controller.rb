class Accounts::DashboardController < ApplicationController
  before_action :require_login
  def show
    @account = Account.find_by_code(params[:id])
    authorize @account
  end
end
