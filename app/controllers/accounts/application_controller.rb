class Accounts::ApplicationController < ApplicationController
  before_action :ensure_contact_details
end