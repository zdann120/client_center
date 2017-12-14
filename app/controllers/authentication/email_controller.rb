class Authentication::EmailController < ApplicationController
  rescue_from ActiveInteraction::InvalidInteractionError,
    with: :invalid_interaction
  def create
    @outcome = Authentication::Email.run(login_params)
    respond_to do |format|
      format.html do
        if @outcome.valid?
          redirect_to root_url, notice: "Success! Please check your email."
        else
          redirect_to root_url, notice: "Sorry, the email address you provided is not enrolled. Please try again, or contact us if you believe this is an error."
        end
      end

      format.js
    end
  end

  def process_token
    @token = params[:token]
    if User.exists?(login_token: @token)
      @user = User.find_by_login_token(@token)
      auto_login @user
      @user.clear_login_token!
      @user.login_token_sent = nil
      @user.save
      redirect_to root_url, notice: 'Welcome!'
    else
      redirect_to root_url, alert: 'Sorry, this login link has expired or has already been used.'
    end
  end

  def logout
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def login_params
    params.require(:authentication_email).permit(:email)
  end

  def invalid_interaction
    redirect_to root_url,
      alert: "Sorry, the email address you provided was not located in our records. Please try again, or contact us if you believe this is an error."
  end
end
