class Accounts::InboundEmailsController < ApplicationController
  before_action :set_account

  def index
    @emails = @account.emails
  end

  def show
    layout false
    @email = Email.find_by_token params[:id]
  end

  private

  def set_account
    @account = Account.find_by_code(params[:account_id])
  end
end
