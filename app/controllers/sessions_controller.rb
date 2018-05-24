class SessionsController < ApplicationController
  def new
  end

  def login_with_google

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:error] = "User not correct or not found"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
    flash[:alert] = "Logged out!"
  end

private

  def auth
    request.env["omniauth.auth"]
  end

end
