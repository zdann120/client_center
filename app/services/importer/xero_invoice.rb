require 'csv'
class Importer::XeroInvoice < ActiveInteraction::Base
  object :account
  file :invoice_csv
  def execute
    result = get_array_of_hashes(invoice_csv)
    invoice = account.invoices.new

    invoice.xero_invoice_number = result['InvoiceNumber']
    invoice.email_address = result['EmailAddress']
    invoice.invoice_date = result['InvoiceDate']
    invoice.due_date = result['DueDate']
    invoice.description = 'Invoice imported from Xero'

    invoice.save

    line_item = invoice.line_items.new

    line_item.description = result['Description']
    line_item.quantity = result['Quantity']
    line_item.unit_price = result['UnitAmount']
    line_item.unit_of_measure = 'EA'

    line_item.save

    errors.merge! invoice.errors
    errors.merge! line_item.errors

    invoice
  end

  private

  def get_array_of_hashes(file)
    csv = CSV.read file.path
    headers = csv.shift.map {|i| i.to_s }
    string_data = csv.map {|row| row.map {|cell| cell.to_s } }
    array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }
    array_of_hashes.first
  end
end