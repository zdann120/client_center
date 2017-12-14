class Authentication::SelfEnrollmentController < ApplicationController
  def begin
  end

  def check_registration_key
    if Account.exists?(registration_key: params[:admin][:registration_key])
      @account = Account.find_by_registration_key(params[:admin][:registration_key])
      session[:self_enroll_account_id] = @account.id
      redirect_to authentication_set_email_url, notice: 'Registration key successfully validated.'
    else
      flash[:notice] = "Registration key is invalid."
      render :begin
    end
  end

  def select_email
    if session[:self_enroll_account_id].blank?
      redirect_to root_url
    else
      @account = Account.find(session[:self_enroll_account_id])
    end
  end

  def process_registration
    @account = Account.find(session[:self_enroll_account_id])
    @outcome = Authentication::SelfEnroll.run(email: params[:user][:email], account_registration_key: @account.registration_key)
    if @outcome.valid?
      redirect_to root_url, notice: "SUCCESS: #{@outcome.result.email} enrolled for account: #{@account.title}."
      session[:self_enroll_account_id] = nil
    else
      flash[:notice] = "#{@outcome.errors.count} error(s): #{@outcome.errors.full_messages.join(', ')}"
      render :select_email
    end
  end
end
