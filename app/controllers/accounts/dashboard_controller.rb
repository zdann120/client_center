class Accounts::DashboardController < ApplicationController
  def show
    @account = Account.find_by_code(params[:code])
    render json: @account
  end
end
