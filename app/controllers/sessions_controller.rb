class SessionsController < ApplicationController
  def new
  end

  def create_with_google
    user_info = request.env["omniauth.auth"]

    user           = User.new
    user.id        = user_info["uid"]
    user.name      = user_info["info"]["name"]
    user.image_url = user_info["info"]["image"]

    session[:user] = Marshal.dump user

    redirect_to root_path
    # if @user = User.google_login
    #    @user.save
    #    session[:user_id] = @user.id
    #    redirect_to user_path(@user)
    # else
    #    flash[:error] = "User not correct or not found GOOGLE"
    #    redirect_to root_path
    #  end
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
