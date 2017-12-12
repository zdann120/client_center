require "administrate/base_dashboard"

class ReceiptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account: Field::BelongsTo,
    charges: Field::HasMany,
    ledger_items: Field::HasMany,
    id: Field::Number,
    type: Field::String,
    reference_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    subtotal: Field::Text
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :account,
    :charges,
    :subtotal,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :account,
    :description,
    :charges,
    :subtotal,
    :id,
    :reference_code,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :account,
    :description,
    :charges,
    :ledger_items
  ].freeze

  # Overwrite this method to customize how receipts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(receipt)
  #   "Receipt ##{receipt.id}"
  # end
end