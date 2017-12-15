class Accounts::InvoicesController < ApplicationController
  before_action :set_account
  def index
    @invoices = @account.invoices
  end

  def show
    @invoice = Invoice.find params[:id]
  end

  private

  def set_account
    @account = Account.find_by_code params[:account_id]
  end
end
