class Authentication::EmailController < ApplicationController
  rescue_from ActiveInteraction::InvalidInteractionError,
    with: :invalid_interaction
  def create
    @outcome = Authentication::Email.run!(login_params)
    if @outcome
      redirect_to root_url, notice: "Success! Please check your email."
    else
      redirect_to root_url, notice: "Trouble logging in."
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
      redirect_to root_url, notice: 'Sorry, no luck.'
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
      notice: "Sorry, there was a problem. Try a different email address."
  end
end
