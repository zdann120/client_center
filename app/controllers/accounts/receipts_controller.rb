class Accounts::ReceiptsController < Accounts::ApplicationController
  before_action :require_login
  before_action :set_account
  before_action :set_accounts_receipt, only: [:show, :edit, :update, :destroy]

  # GET /accounts/receipts
  def index
    @receipts = @account.receipts
  end

  # GET /accounts/receipts/1
  def show
    authorize @receipt
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounts_receipt
      @receipt = Receipt.find(params[:id])
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a trusted parameter "white list" through.
    def accounts_receipt_params
      params.fetch(:accounts_receipt, {})
    end
end
