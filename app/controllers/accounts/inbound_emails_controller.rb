class Accounts::InboundEmailsController < ApplicationController
  before_action :set_account

  def index
    @emails = @account.emails
  end

  def show
    @email = Email.find_by_token params[:id]
    render :show, layout: false
  end

  def show_html
    @email = Email.find_by_token params[:id]
    render :show_html, layout: false
  end

  private

  def set_account
    @account = Account.find_by_code(params[:account_id])
  end
end