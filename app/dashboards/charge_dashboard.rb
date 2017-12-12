require "administrate/base_dashboard"

class ChargeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ledger: Field::BelongsTo,
    receipt: Field::BelongsTo,
    id: Field::Number,
    description: Field::String,
    quantity: Field::Number,
    unit_of_measure: Field::String,
    unit_price_cents: Field::Number,
    unit_price: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type: Field::String,
    line_total: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :receipt,
    :line_total,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :receipt,
    :id,
    :description,
    :quantity,
    :unit_of_measure,
    :unit_price,
    :line_total,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ledger,
    :description,
    :quantity,
    :unit_of_measure,
    :unit_price_cents,
    :type,
  ].freeze

  # Overwrite this method to customize how charges are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(charge)
  #   "Charge ##{charge.id}"
  # end
end
