ActiveAdmin.register_page "Account::Appointment" do
  belongs_to :account
  content do
    @account = Account.find params[:account_id]
    h3 "Add Appointment: #{@account.title}"
    panel 'New Appointment' do
      render partial: 'admin/accounts/appointment_form'
    end
  end

  page_action :save_appointment, method: :post do
    account = Account.find params[:account_id]
    appointment = account.appointments.new(appointment_params)
    if appointment.save
      redirect_to admin_account_account_appointment_url, notice: 'Appointment saved!'
    else
      redirect_to admin_account_account_appointment, alert: "No luck."
    end
  end

  controller do
    before_action :set_account
    def set_account
      @account = Account.find params[:account_id]
    end
    def appointment_params
      params.require(:appointment)
        .permit(:starts_at, :description)
    end
  end

end
