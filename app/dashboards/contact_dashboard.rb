require "administrate/base_dashboard"

class ContactDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    contactable: Field::Polymorphic,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    business_name: Field::String,
    address_line_1: Field::String,
    address_line_2: Field::String,
    city: Field::String,
    state: Field::String,
    zip_code: Field::String,
    country: Field::String,
    primary_phone: Field::String,
    alternate_phone: Field::String,
    linking_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :contactable,
    :id,
    :first_name,
    :last_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :contactable,
    :id,
    :first_name,
    :last_name,
    :business_name,
    :address_line_1,
    :address_line_2,
    :city,
    :state,
    :zip_code,
    :country,
    :primary_phone,
    :alternate_phone,
    :linking_code,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :contactable,
    :first_name,
    :last_name,
    :business_name,
    :address_line_1,
    :address_line_2,
    :city,
    :state,
    :zip_code,
    :country,
    :primary_phone,
    :alternate_phone,
    :linking_code,
  ].freeze

  # Overwrite this method to customize how contacts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(contact)
  #   "Contact ##{contact.id}"
  # end
end
