class SessionsController < ApplicationController
  def new

  end

  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      flash[:success] = 'Signed in by Facebook successfully'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Error while signing in by Facebook. Let's register"
      redirect_to new_user_path
    end
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

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
