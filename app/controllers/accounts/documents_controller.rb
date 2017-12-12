class Accounts::DocumentsController < ApplicationController
  def show
    @account = Account.find(params[:account_id])
    @document = Document.find(params[:id])
  end

  def new
    @account = Account.find(params[:account_id])
    @document = @account.documents.new
  end

  def create
    @account = Account.find(params[:account_id])
    @document = @account.documents.new(document_params)
  end

  private

  def document_params
    params.require(:document).permit(:asset)
  end
end
