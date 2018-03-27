class SessionsController < ApplicationController
  def new

  end

  def create_with_facebook
   # @user = User.from_omniauth(auth)
   #   if @user
   #     session[:user_id] = @user.id
   #     redirect_to user_path(@user)
   @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id
     # else
     #   redirect_to '/login', flash[:notice] = "Oops, something went wrong here. Please try again."
     # end
   end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      #need error message
      #flash.now.alert = "Email or password is invalid"
      flash[:notice] = "User not correct or not found"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out!"
  end

private

  def auth
    request.env['omniauth.auth']
  end

end
