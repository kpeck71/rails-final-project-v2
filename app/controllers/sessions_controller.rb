class SessionsController < ApplicationController
  def new
  end

  def create_with_google
    #if @user = User.find_or_create_by(uid: auth['uid']) do |u|
    # if @user = User.find_or_create_by(email: auth['info']['email']) do |u|
    #    u.name = auth['info']['name']
    #    u.email = auth['info']['email']
    #    u.password = "Hellothisisatest"
    #    end
    if @user = User.google_login
       @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
       flash[:error] = "User not correct or not found GOOGLE"
       redirect_to root_path
     end

    # @user = User.from_omniauth(auth)
    #   if @user
    #     session[:user_id] = @user.id
    #     redirect_to user_path(@user)
    #   end

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
