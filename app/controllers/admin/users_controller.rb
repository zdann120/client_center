module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def resource_params
      params.require(:user)
        .permit(
          permitted_attributes,
          contact_attributes: [
            :first_name, :last_name,
            :business_name, :address_line_1,
            :address_line_2, :city, :state,
            :zip_code, :primary_phone,
            :alternate_phone, :country
          ]
        )
    end
  end
end
