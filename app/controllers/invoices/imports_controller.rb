class Invoices::ImportsController < ApplicationController
  def new_xero
    @account = Account.find_by_code params[:account_id]
  end

  def process_xero
    @account = Account.find_by_code params[:account_id]
    @outcome = Importer::XeroInvoice.run(invoice_csv: params[:upload][:file], account: @account)
    if @outcome.valid?
      redirect_to account_url(@account.code), notice: "Xero invoice successfully imported."
    else
      redirect_to account_url(@account.code), notice: "There was an issue importing this Xero invoice."
    end
  end
end
